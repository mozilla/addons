#!/bin/bash

COUNT=${COUNT:-1}
STATES=${STATES:-"[OPEN, CLOSED]"}
ISSUE_NUMBER=${ISSUE_NUMBER:-}

set -xu

# Required environment variables
# GITHUB_TOKEN: GitHub token with repo scope
# FROM_NAME: Repository name to transfer issues from

# Optional environment variables
# ISSUE_NUMBER: Issue number to transfer (will nullify COUNT)
# COUNT: Number of issues to transfer

# The label ID for https://github.com/mozilla/addons/labels/migration%3A2024
MIGRATION_LABEL_ID="LA_kwDOAn4H8M8AAAABmbq8hA"

REPOSITORY_OWNER="mozilla"
TO_NAME="addons"
ALLOWED_REPOS="addons-server,addons-frontend"
FROM_REPO="$REPOSITORY_OWNER/$FROM_NAME"
TO_REPO="$REPOSITORY_OWNER/$TO_NAME"

echo """
FROM_NAME: $FROM_NAME

REPOSITORY_OWNER: $REPOSITORY_OWNER
TO_NAME: $TO_NAME
ALLOWED_REPOS: $ALLOWED_REPOS
FROM_REPO: $FROM_REPO
TO_REPO: $TO_REPO

ISSUE_NUMBER: $ISSUE_NUMBER
COUNT: $COUNT
STATES: $STATES
"""

auth_status=$(gh auth status 2>&1)

if [[ "$auth_status" == *"You are not logged into any GitHub hosts."* ]]; then
  echo "Error: $auth_status"
  exit 1
fi

if [[ ! "$ALLOWED_REPOS" =~ (^|,)"$FROM_NAME"(,|$) ]]; then
  echo "Invalid FROM_NAME "$FROM_NAME". Exiting..."
  exit 1
fi

function get_single_issue() {
  local issues_query="""
    query {
      repository(owner: \"$REPOSITORY_OWNER\", name: \"$FROM_NAME\") {
        issue(number: $ISSUE_NUMBER) {
          id
        }
      }
    }
  """

  local issues=$(gh api graphql -f query="$issues_query" --jq '.data.repository.issue.id')

  echo "$issues"
}

function get_multiple_issues() {
  local issues_query="""
    query {
      repository(owner: \"$REPOSITORY_OWNER\", name: \"$FROM_NAME\") {
        issues(first: $COUNT, states: $STATES, orderBy: {field: CREATED_AT, direction: ASC}) {
          nodes {
            id
          }
        }
      }
    }
  """

  local issues=$(gh api graphql -f query="$issues_query" --jq '.data.repository.issues.nodes[].id')

  echo "$issues"
}

if [[ -n "$ISSUE_NUMBER" ]]; then
  echo "Transferring issue $ISSUE_NUMBER from \"$FROM_REPO\" to \"$TO_REPO\""
  issues=$(get_single_issue)
else
  echo "Transferring $COUNT issues from \"$FROM_REPO\" to \"$TO_REPO\""
  issues=$(get_multiple_issues)
fi

if [[ $(echo $issues | jq '.data.repository') == "null" ]]; then
  exit 1
fi

transfer_mutation="mutation {"

new_issues_counter=1

repository_id=$(gh repo view "$TO_REPO" --json id --jq '.id')

while IFS= read -r issue_id; do
  transfer_mutation+=" t${new_issues_counter}: transferIssue(input: { issueId: \"${issue_id}\", repositoryId: \"${repository_id}\", createLabelsIfMissing: true }) { issue { id url } }"
  new_issues_counter=$((new_issues_counter+1))
done <<< "$issues"

transfer_mutation+=" }"

new_issues=$(gh api graphql -f query="$transfer_mutation" --jq '.data | keys[] as $k | {url: .[$k].issue.url, id: .[$k].issue.id}')

repo_label="repository:$FROM_NAME"

gh label create $repo_label -R "$TO_REPO" --force

label_id=$(gh api /repos/$TO_REPO/labels/$repo_label --jq '.node_id')

label_mutation="mutation {"

label_counter=1

while IFS= read -r id; do
  label_mutation+=" l${label_counter}: addLabelsToLabelable(input: {labelableId: \"$id\", labelIds: [\"$label_id\", \"$MIGRATION_LABEL_ID\"]}) { __typename }"
  label_counter=$((label_counter+1))
done <<< $(echo "$new_issues" | jq -r '.id')

label_mutation+=" }"

gh api graphql -f query="$label_mutation"

echo "$new_issues" | jq -r '.url'
