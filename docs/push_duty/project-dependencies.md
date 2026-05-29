# Project dependencies

Project dependencies are not tagged as part of the push duty responsibilities.
If you're working on a feature in a project that's a dependency of a project
e.g. ``addons-linter``, then it's *your* responsibility to make a release and
update the project that consumes that dependency in time for the tag.

This way we can ensure that:

  * Dependency packages are built and released in time for the tag.
  * The new feature in the new version of a package has been validated on
    -dev.

Making multiple releases of a package during a weekly milestone is totally
fine since this helps with testing smaller sets of changes.
