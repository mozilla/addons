Push Duty
=========

The pushing of the server rotates each week to another developer. Current rotation is:

* andym
* kumar
* magopian
* mstriemer
* muffinresearch
* nolski
* tofumatt

Check out the `Add-ons calendar <https://www.google.com/calendar/embed?src=mozilla.com_lr5jsh38i6dmr72uu4d1nv7dcc%40group.calendar.google.com>`_ for a list of events.

Before the push
---------------

Tag the repos
+++++++++++++

The code that will go in production on Thursday is tagged on Tuesday. The
following repositories are tagged:

    * `olympia <https://github.com/mozilla/olympia/>`_

Tags are of the format: YYYY.MM.DD,

.. note:: the date is the date of the push, not the date of tagging.

It's usually the master branch that is tagged::

    $ git checkout master
    $ git pull
    $ git tag 2015.09.10
    $ git push --tags

Get a compare link from github to compare this tag to the last tag. Add that
compare link to the etherpad so that people can clearly see what is pushing.

If tagging the master branch can't be done (some feature is already on master,
but not ready for production), then instead the commits that need to go in
production should be cherry-picked::

    $ git checkout 2015.09.03  # Previous tag pushed to production.
    $ git cherry-pick <commit hash>
    $ git tag 2015.09.10
    $ git push --tags

Push to stage
+++++++++++++

Once the tag is done, it needs to be pushed to the staging server, using the
ops jenkins: click on "build with parameters", and enter the tag (eg
2015.09.10). Jason can help with that if needed.

Before the push
+++++++++++++++

Keep an eye out for any blocking bugs. Add them to the etherpad and find
someone to work on them.

Push
----

The tag is pushed to production by Jason, once approved by Krupa, on Thursdays.
It is the responsibility of the push hero to follow-up with Krupa and Jason,
and be around during the push for any unexpected issues.

Monitoring the push
+++++++++++++++++++

The best places to monitor the results of the push are:

* `Sentry <http://sentry.mktmon.services.phx1.mozilla.com/mkt/addonsmozillaorg/>`_
* `Graphite <http://dashboard.mktadm.ops.services.phx1.mozilla.com/graphite?site=addons&graph=all-responses>`_

.. note:: Both of these URLs require you to be logged into Mozilla VPN.

Graphite should show no large spikes or changes. Sentry should show no new errors, although
it will show intermittent errors and the occasional error as the push occurs.

Once complete
+++++++++++++

Create a new etherpad page for the *next push*, for example:

https://etherpad.mozilla.org/amo-2015-09-10

You can use this handy template:

.. literalinclude:: /server/push_etherpad.tpl

After completing a push, send an email to the dev.addons mailing list saying
that the push is done with any issues. Here's the template:

.. literalinclude:: /server/push_email.tpl

Future Goals
------------

Move to continuous deployment and change the way this is done dramatically.
