================
Push Duty (Next)
================

Push duty rotates each week to another developer. The current rotation is:

* eviljeff
* mat
* kmeinhardt

Check out the `Add-ons calendar <https://calendar.google.com/calendar/embed?src=mozilla.com_lr5jsh38i6dmr72uu4d1nv7dcc@group.calendar.google.com>`_ for a list of events.

Before the push
---------------

Before a push, we continuously land and deploy code to dev by merging PRs to master in respective repositories. During this time, individuals and/or the push hero might update the upcoming release document with notes for pre/post deployment tasks. Refer to the :doc:`release docs <./release-docs>` for more information.

On Tuesday at `09:00 PT <http://www.timebie.com/std/pst.php?q=9>`_, we deploy to stage. This is the time to:

- push tags for manually deployed services (see :doc:`tag services <./tag-services>`)
- publish the release document. (see :doc:`publish release <./publish-release>`)
- QA and cherry pick if necessary (see :doc:`staging QA <./staging-qa>` and :doc:`cherry picking <./cherry-picking>`)

During Push
-----------

On Thursday at `09:00 PT <http://www.timebie.com/std/pst.php?q=9>`_, we deploy to production. This is the time to:

- meet with SRE and QA in the remora slack channel (see :doc:`remora <./remora>`)
- approve the stage deployments to push to production (see :doc:`deployments <./deployments>`)
- push extension-workshop to production if needed (see :doc:`tag-services <./tag-services>`)
- monitor the push in sentry and grafana for any issues (see :doc:`monitoring <./monitoring>`)

After the push
--------------

- create a new release document for the next push hero (see :doc:`release docs <./release-docs>`)
- update the topic of the AMO Matrix channel and the #remora slack channel to include the handle of next week's push hero (see :doc:`remora <./remora>`)
