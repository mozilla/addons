# Tag Services

## Manually tagging a service

`addons-server` is automatically tagged when a release is published. See [release-docs](./release-docs.md) for more information.

For now, `addons-frontend` is still manually tagged.
To create and push a new tag follow these steps:

Tags are of the format: ``YYYY.MM.DD``,

```{note}
The date is the date of the push, not the date of tagging.
```

## Checking out the default branch

To create a new tag, you have to checkout a branch that will be used for the tag.
This is almost always the default branch of the repository.

You can find out the default branch by running

```bash
gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'
```

```{note}
You need to have the GitHub CLI installed to run this command.
```

## Creating and pushing the tag

Once you've checked out the right branch, make sure you have the latest changes by running:

```bash
git pull
```

```{warning}
Make absolutely sure you are pulling from the correct remote.
```

Create the tag by simply running the command:

```bash
git tag <tag-date>
```

Push the tag to the remote repository:

```bash
git push <remote> <tag-date>
```

Here is a full example:

```bash
git checkout master
git pull
git tag 2015.09.10
git push upstream 2015.09.10
```

## Checking the remote

You can find out which remote is the upstream by running ``git remote -v``.
This will output something like:

```bash
origin  https://github.com/your-username/your-repo.git (fetch)
upstream  https://github.com/mozilla/addons-server.git (fetch)
```

```{note}
If you don't have the upstream remote set up, you can add it by running:
```

```bash
git remote add upstream <upstream-url>
```
