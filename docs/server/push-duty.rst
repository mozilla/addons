Push Duty
=========

The pushing of the server rotates each week to another developer. Current rotation is:

* andym
* kumar
* magopian
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

Tags are of the format: YYYY.MM.DD

It's usually the master branch that is tagged::

    $ git checkout master
    $ git pull
    $ git tag 2015.09.10
    $ git push --tags

If tagging the master branch can't be done (some feature is already on master,
but not ready for production), then instead the commits that need to go in
production should be cherry-picked::

    $ git checkout 2015.09.03  # Previous tag pushed to production.
    $ git cherry-pick <commit hash>
    $ git tag 2015.09.10
    $ git push --tags

An etherpad is created that contains blocking bugs and the like, for example:

https://etherpad.mozilla.org/amo-2015-09-10

You can use this handy template:

.. literalinclude:: /server/push_etherpad.tpl

Push to stage
+++++++++++++

Once the tag is done, it needs to be pushed to the staging server, using the
ops jenkins: click on "build with parameters", and enter the tag (eg
2015.09.10). Jason can help with that if needed.

Push
----

The tag is pushed to production by Jason, once approved by Krupa, on Thursdays.
It is the responsibility of the push hero to follow-up with Krupa and Jason,
and be around during the push for any unexpected issues.

After completing a push, send an email to the dev.addons mailing list saying
that the push is done with any issues. Here's the template:

.. literalinclude:: /server/push_email.tpl

Future Goals
------------

Move to continuous deployment and change the way this is done dramatically.
