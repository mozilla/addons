#!/bin/bash

set -ue

continue=true
workflow=90730614

max_iteration=1000
cur_iteration=0
failure_count=0
max_failure=10

while [[ "$cur_iteration" -lt "$max_iteration" ]]; do
  cur_iteration=$((cur_iteration + 1))
  echo "Iteration: $cur_iteration"

  rate_limit=$(gh api /rate_limit)
  echo "rate_limit: $rate_limit"

  if [[ $rate_limit =~ "remaining":0 ]]; then
    echo "Rate limit exceeded. Sleeping for 1 hour..."
    sleep 600
    continue
  fi

  issue_count=$(gh api graphql -f query="query { repository(owner: \"mozilla\", name: \"$from_name\") { issues(states: $states) { totalCount } } }" --jq '.data.repository.issues.totalCount')

  if [[ "$issue_count" -eq 0 ]]; then
    echo "No issues found. Exiting..."
    exit 0
  else
    echo "Found $issue_count issues"
  fi

  echo "Transferring $count issues from \"$from_name\" to \"addons\""

  gh secret set K_PAT --body "$pat"
  gh workflow run --ref fix-script "$workflow" \
    --field count="$count" \
    --field from_name="$from_name" \
    --field secret_name="K_PAT" \
    --field states="$states"

  checking=true
  conclusion=""

  sleep 5

  while [[ "$checking" == true ]]; do
    result=$(gh run list \
      --workflow $workflow \
      --limit 1 \
      --json status \
      --json conclusion \
      --jq '.[]'
    )

    status=$(echo $result | jq -r '.status')
    conclusion=$(echo $result | jq -r '.conclusion')

    echo "Checking status: $status and conclusion: $conclusion"

    if [[ "$status" == "completed" ]]; then
      checking=false
    fi
    sleep 10
  done

  if [[ "$conclusion" == "failure" ]]; then
    echo "Transfer failed "
    failure_count=$((failure_count + 1))

    echo "Transfer failed ${failure_count} times."
    if [[ "$failure_count" -gt $max_failure ]]; then
      echo "Max failure limit reached. Exiting..."
      exit 1
    else
      echo "Wait for content limit"
      sleep 3600
    fi
  fi
done
