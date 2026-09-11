# `release` action

Prepares a _draft_ GitHub release from a merged release Pull Request (PR): the
tag is the version in the title of the merge commit, the target is that commit
and the notes are its description.

## Usage

```yaml
on:
  pull_request:
    types: [closed]
    branches: [main]

permissions: {}

jobs:
  draft-release:
    if: |
      github.event.pull_request.merged == true &&
      startsWith(github.event.pull_request.head.ref, 'releases/')
    runs-on: ubuntu-latest
    permissions:
      # Required to create the draft release.
      contents: write

    steps:
      # Pin to a commit of `mozilla/addons`.
      - uses: mozilla/addons/.github/actions/release@43401a931ebc09f2e511deed766171b0105414bc
        with:
          repo: ${{ github.repository }}
          sha: ${{ github.event.pull_request.merge_commit_sha }}
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

All three inputs are required. Outputs: `version` and `url`.

## Release process

A release starts with a PR from a `releases/*` branch, with a single commit
that bumps the version, mentions it in its title and has the release notes as
its description. Versions follow [semantic versioning](https://semver.org/).

Here is an example for an `npm` package:

1. Create the release PR (`npm version` takes `minor`, `patch` or `major`, and
   `--no-git-tag-version` only updates `package.json` and `package-lock.json`):

   ```
   version=$(npm version minor --no-git-tag-version)
   git switch -c "releases/$version"
   git add package.json package-lock.json
   # Write the release notes in the description of this commit, also the commit
   # title might just be "$version" or something more fancy, but it must have
   # the version number in it.
   git commit --edit --message ":arrow_up: release $version"
   git push -u origin "releases/$version"
   ```

2. Open the PR: `gh pr create --fill`

3. Get it reviewed, then squash and merge it, keeping the release notes in the
   description of the merge commit (GitHub pre-fills them). The draft release
   is prepared, but nothing has been released yet!

4. Open the draft release and click _Publish release_. This creates the tag,
   which makes CI publish the package to npm. That allows other workflows to be
   triggered as well.
