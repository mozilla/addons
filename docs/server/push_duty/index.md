# Push Duty (Next)

Push duty rotates each week to another developer. The current rotation is:

- eviljeff
- mat

Check out the [Add-ons calendar](https://calendar.google.com/calendar/embed?src=mozilla.com_lr5jsh38i6dmr72uu4d1nv7dcc@group.calendar.google.com) for a list of events.

## Before the push

Before a push, we continuously land and deploy code to dev by merging PRs to master in respective repositories. During this time, individuals and/or the push hero might update the upcoming release document with notes for pre/post deployment tasks. Refer to the [release docs](./release-docs) for more information.

On Tuesday at [09:00 PT](http://www.timebie.com/std/pst.php?q=9), we deploy to stage. This is the time to:

- push tags for manually deployed services (see [tag services](./tag-services))
- publish the release document. (see [release docs](./release-docs))
- QA and cherry pick if necessary (see [staging QA](./staging-qa) and [cherry picking](./cherry-picking))

## During Push

On Thursday at [09:00 PT](http://www.timebie.com/std/pst.php?q=9), we deploy to production. This is the time to:

- meet with SRE and QA in the remora slack channel (see [remora](./remora))
- approve the stage deployments to push to production (see [deployments](./deployments))
- push extension-workshop to production if needed (see [tag-services](./tag-services))
- monitor the push in sentry and grafana for any issues (see [monitoring](./monitoring))

## After the push

- create a new release document for the next push hero (see [release docs](./release-docs))
- update the topic of the AMO Matrix channel and the #remora slack channel to include the handle of next week's push hero (see :doc:`remora <./remora>`)

## Runbooks

This section will outline the steps to take for specific actions that you might need to perform before, during and/or after a push. The push runbook is a living document and should be updated as needed. Please reference it in the push notes for each push. As well as in the above push duty document.

```{toctree}
:maxdepth: 2

release-docs.md
tag-services.md
staging-qa.md
cherry-picking.md
deployments.md
remora.md
monitoring.md

project-dependencies.md
security-fixes.md
extension-workshop.md
push-to-stage.md
extract-locales.md
```
