# Cherry picking

Deploying changes to stage and production outside the regular release schedule is done through cherry-picks from `master` branch to a new tag made from the one that you want to replace.

The process is the same for both addons-frontend and addons-server.

## Figuring out what to pick

Make a list of commits to cherry-pick for each repository, in chronological order so that they can be applied with the fewer amount of conflicts possible.

## Checking out the existing tag

In the clone of the repository, check out the existing tag you want to replace:

```bash
git pull --tags
git checkout <tag>
```

## Cherry-picking

Now that you're on the tag you want to start from, cherry-pick commits from the list you
made above:

```bash
git cherry-pick <commit2>
git cherry-pick <commit2>
...
```

Once that is done, create and push the new tag. The convention we used is to append a
dash followed by a number to the existing tag. If a tag containing cherry-picks was
already pushed, increment the number instead:

```bash
git tag <tag>-<x>
git push upstream <tag>-<x>
```

For instance, if you started from `2026.05.28` and wanted to cherry-pick something, the tag would be `2026.05.28-1`. Once that new tag is pushed, cherry-picking a different set of commits would start from that new tag, incrementing the number, so the newer tag would be `2025.05.28-2`.

## Making or editing the release

If you're _only_ cherry-picking addons-frontend commits:
- Edit the latest release addons-server.

If you're cherry-picking addons-server commits:
- Start by [drafting a new release manually on addons-server](https://github.com/mozilla/addons-server/releases/new).
- Pick your tag in the list and name your release the same as the tag (should be following `<tag>-<x>` format).

If the tag you started from never hit production:
- Copy/paste the description from the corresponding release on addons-server as a starting point

Otherwise:
- Start with a fresh description from the [release template](https://github.com/mozilla/addons-server/blob/master/.github/release-template.md)

Adjust the description to say which tag you started from, and add commits you've picked to the `Cherry-picks` section.

Once you're ready, you can update or publish your release and deploy it to production later like a normal release.

## Gotchas

Cherry-picked releases will essentially create a unique combinaison of code that hasn't necessarily been as thoroughly tested on dev than a regular release. The main things to worry about are:

### Dependencies

Inspect commits beforehand to ensure they don't depend on something that is not in the cherry-picked release (for instance, if multiple follow-up commits were made on `master`, or if several commits were made in the same area in parallel, you might need to cherry-pick them all).

### Conflicts

Sometimes picking those other commits a single change depends on isn't a viable option, and you might get conflicts. Resolve them as you would a normal merge conflict, but be extra careful that the end result makes sense on its own.

### Database migrations

Special care should be taken if cherry-picked commits contain database migrations: We want to ensure all migrations dependencies are present, and no migration has been skipped for each app.

Be mindful of the state of the database: dev, stage and production environments should be eventually consistent.
