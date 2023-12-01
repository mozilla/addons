Here you will find helpful information for contributing to any of the many repositories owned by the Mozilla addons team.

The addons team is responsible for many repositories, some of which with higher activity than others.
We aim to maintain a set of standards which all repositories should follow,
but we value cohesion over consistency and some repositories might decide not to follow every standard exactly the same

Every repository should have a CONTRIBUTING.md file that initially links back to this file. 
This document should be considered the baseline to be extended by individual repositories.
Check the contributing doc for a specific repository to understand more about a particular context.

## Commits

TBD

## Branching

Most new code is developed in local one-off branches, usually encompassing one or two patches to fix a bug.
Upstream doesn’t care how you do local development, but we don’t want to see a merge commit every time you merge a single patch from a branch.
Merge commits make for a noisy history, which is not fun to look at and can make it difficult to cherry-pick hotfixes to a release branch.
We do like to see merge commits when you’re committing a set of related patches from a feature branch.
The rule of thumb is to rebase and use fast-forward merge for single patches or a branch of unrelated bug fixes, but to use a merge commit if you have multiple commits that form a cohesive unit.

Here are some tips on [Using topic branches]([url](http://blog.mozilla.com/webdev/2011/11/21/git-using-topic-branches-and-interactive-rebasing-effectively/)) and interactive rebasing effectively.

## Pull requests

(I would recommend we use a common pullrequest template and enforce this pretty strictly)

Every pull request should follow the PR template specified in the repository.
- link to an issue
- description of the change
- steps to test the PR
- checklist
  - added tests
  - tested the code locally
  - safe to rollback

## Code review

TBD

## Continuous Integration

TBD

## Deployment

TBD
