# Push Duty

Production deploys are scheduled every other week. Push duty rotates each deploy to another developer. The current rotation is:

- [Andrew](https://people.mozilla.org/p/eviljeff)
- [Mathieu](https://people.mozilla.org/p/mat)
- [Christina](https://people.mozilla.org/p/chrlin)
- [William](https://people.mozilla.org/p/willdurand)
- [Benjamin](https://people.mozilla.org/p/bgrant)

## Before the push

Before a push, we continuously land and deploy code to dev by merging PRs to master in respective repositories. During this time, individuals and/or the push hero might update the upcoming release document with notes for pre/post deployment tasks. Refer to the [release docs](./release-docs) for more information.

On Tuesday around [09:00 PT](http://www.timebie.com/std/pst.php?q=9), we deploy to stage. This is the time to publish the release that will be deployed to stage (see [release docs](./release-docs)).

QA will then check stage for defects.

### Cherry-picks

If any follow-ups are needed after the release has been deployed to stage, (see [cherry picking](./cherry-picking)).

## During Push

On Thursday around [09:00 PT](http://www.timebie.com/std/pst.php?q=9), we deploy to production. This is the time to:

- Meet with QA in the `#addons-production` slack channel
- Approve the stage deployments to push to production
- Push extension-workshop to production if needed (see [tag-services](./tag-services))
- Monitor the push in sentry and grafana for any issues (see [monitoring](./monitoring))

## After the push

- Create a new release document for the next push hero (see [release docs](./release-docs))
- Update the topic of the `#addons-production` slack channel to include the handle of next week's push hero

## Runbooks

This section will outline the steps to take for specific actions that you might need to perform before, during and/or after a push. The push runbook is a living document and should be updated as needed. Please reference it in the push notes for each push. As well as in the above push duty document.

```{toctree}
:maxdepth: 2

release-docs.md
tag-services.md
cherry-picking.md
monitoring.md
project-dependencies.md
security-fixes.md
extension-workshop.md
```
