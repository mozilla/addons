Push Duty
=========

The pushing of the server rotates each week to another developer. Current rotation is:

* eviljeff
* mat
* kmeinhardt

Check out the `Add-ons calendar <https://calendar.google.com/calendar/embed?src=mozilla.com_lr5jsh38i6dmr72uu4d1nv7dcc@group.calendar.google.com>`_ for a list of events.

Before the push
---------------


The code that will go in production on Thursday is tagged on Tuesday
at `09:00 PT <http://www.timebie.com/std/pst.php?q=9>`_.
The following repositories are tagged:

    * `addons-server <https://github.com/mozilla/addons-server/>`_
    * `addons-frontend <https://github.com/mozilla/addons-frontend/>`_
    * `addons-code-manager <https://github.com/mozilla/addons-code-manager/>`_

The following repositories are immediately deployed to production when
they are tagged. As such, one can update these projects at any time:

    * `extension-workshop <https://github.com/mozilla/extension-workshop/>`_

Project Dependencies
++++++++++++++++++++

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

Security Fixes
++++++++++++++

Security issues against AMO are currently reported in bugzilla. When someone is
assigned to work on one, they should open a new draft security advisory
describing the security issue and linking to the bugzilla bug, but not publish
it. That unlocks the ability to have a private PR and fork to work on the
issue.

The corresponding private PR should is reviewed as normal but once it has been
reviewed, it should *not* be merged right away. Instead, it should be called
out in the release notes for the next release. Merging to ``master`` is part
of push duty and happens right before tagging, using GitHub regular merge
functionality on the PR. The advisory can then be closed (it's never
published).

Tag the repos
+++++++++++++

Tags are of the format: ``YYYY.MM.DD``,

.. note:: The date is the date of the push, not the date of tagging.

.. note:: Once addons-frontend has been tagged a new docker image will be
   built on `CircleCI`_ and is
   required to deploy to stage.

It's usually the main branch that is tagged::

    $ git checkout main
    $ git pull
    $ git tag 2015.09.10
    $ git push upstream 2015.09.10

.. note:: Here we are using "upstream" as the remote. If yours is different
   you can substitute "upstream" for whatever you call the ``mozilla/addons-server``
   repo remote.

Get a compare link from github to compare this tag to the last tag. Add that
compare link to the push doc so that people can clearly see what is pushing.

If tagging the main branch can't be done (some feature is already on main,
but not ready for production), then the commits that need to be released
should be cherry-picked

If you're adding cherry-picks to a tag that already exists, it makes sense to
create a new tag rather than overwrite the old one. The reason for this is that
re-using a tag makes it less easy to see the process that was involved in arriving
at that tag. Also, it's entirely possible to make a mistake by using an old tag
that exists locally rather than the newer version on the remote when tags are
re-used.

When creating a new tag you can use the format ``YYYY.MM.DD-SUFFIX`` where suffix
is a number that's incremented with each revision. The first time this is done
will look like this::

    $ git checkout 2015.09.03
    $ git cherry-pick <commit hash> # as many times as you need
    $ git tag 2015.09.10-1
    $ git push upstream 2015.09.10-1

And the second::

    $ git checkout 2015.09.03-1
    $ git cherry-pick <commit hash> # as many times as you need
    $ git tag 2015.09.10-2
    $ git push upstream 2015.09.10-2

Then update the push doc with the new comparison link for the updated tag.

Extension Workshop
__________________

As of April 2024, Extension Workshop only has two environments:

* `stage <https://extensionworkshop.allizom.org>`_ - auto-deployed on every commit pushed to the main branch
* `prod <https://extensionworkshop.com>`_ - deployed with a tag (``YYYY.MM.DD``)

You should manually sense-check the stage environment is currently okay
before tagging, and then creating and pushing a git tag to the Extension
Workshop repository will deploy it to production. You should manually
verify the site on prod after the push has been completed. Visit
https://extensionworkshop.com and view any pages that have been changed
since the last push to verify they exist and are rendering properly.

    $ git checkout master
    $ git pull
    $ git tag 2024.04.18
    $ git push upstream 2024.04.18

Push to stage
+++++++++++++

Our infrastructure automates pushing the tags to stage once the tags have
been pushed up to the repository.

The only required step is to check that the tag has deployed by looking out for the automated push messages in the internal slack channel.

You can also check ``/__version__`` or ``/__frontend_version__`` on a given service which shows the currently
deployed revision and tag e.g:

 * `Addons Server (stage) <https://addons.allizom.org/__version__>`_
 * `Addons Frontend (stage) <https://addons.allizom.org/__frontend_version__>`_
 * `Addons Code Manager (stage) <https://code.addons.allizom.org/__version__>`_

Extract locales
+++++++++++++++
Once you are done pushing the tags to stage:

 * Run the ``./bin/run-l10n-extraction`` command in ``addons-frontend`` repository (`documentation <https://github.com/mozilla/addons-frontend/blob/master/docs/i18n.md>`_).
 * Run the ``./scripts/extract-l10n.sh`` command in ``addons-server`` repository.

Because the `addons-server` is meant to be used inside the docker container, it doesn't have access to your `git` credentials, so you'll need to enter the container, run the script, exit the container and push the branch created by script. The `addons-frontend` one does that for you, but in both cases you'll need to open the pull request yourself.

Before the push
+++++++++++++++

Keep an eye out for any blocking bugs. Add them to the etherpad and find
someone to work on them.

Push
----

The tag is pushed to production by ops (wezhou), once approved by QA (Krupa), on Thursdays.
It is the responsibility of the push hero to follow-up with QA and ops,
and be around during the push for any unexpected issues.

Monitoring the push
+++++++++++++++++++
The best places to monitor the results of the push are:

* `Sentry <https://sentry.prod.mozaws.net/operations/olympia-prod/>`_
* `Grafana <https://earthangel-b40313e5.influxcloud.net/>`_

  * `Ops dashboard <https://earthangel-b40313e5.influxcloud.net/d/CsSDyxTZz/amo-by-wezhou>`_
  * `Prod Health dashboard <https://earthangel-b40313e5.influxcloud.net/d/3q-fOyOWk/amo-prod-health>`_
  * `API usage/performance dashboard <https://earthangel-b40313e5.influxcloud.net/d/kiTC7XDZz/amo-prod-frontend-apis-usage-performance>`_

The site performance graphs should show no large spikes or changes.
Sentry should show no new errors, although it will show intermittent errors and the occasional
error as the push occurs.

Once complete
+++++++++++++

Create a new github document for the *next push*, for example:

https://github.com/mozilla/addons/blob/main/releases/2019/05/09.md

You can use this handy template:

.. literalinclude:: /server/push_notes.tpl

Set the topic of the `AMO Matrix channel <https://chat.mozilla.org/#/room/#amo:mozilla.org>`_ and `#remora` slack channel to include the new github doc link and the relevant nickname of next week's push hero.

Future Goals
------------

Move to continuous deployment and change the way this is done dramatically.

.. _`CircleCI`: https://circleci.com/gh/mozilla/addons-frontend
