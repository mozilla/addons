# Monitoring

QA will perform a sanity check on the site once the push is done.

The best places to monitor the results of the push are:

  * `Sentry <https://sentry.prod.mozaws.net/operations/olympia-prod/>`_
  * `Grafana <https://https://yardstick.mozilla.org/>`_
  * `SRE dashboard <https://yardstick.mozilla.org/d/CsSDyxTZ1/amo?>`_
  * `Prod Health dashboard <https://yardstick.mozilla.org/d/3q-fOyOWk34/amo-prod-health>`_
  * `API usage/performance dashboard <https://yardstick.mozilla.org/d/kiTC7XDZ1/amo-prod-frontend-apis-usage-performance>`_

The site performance graphs should show no large spikes or changes.
Sentry should show no new errors, although it will show intermittent errors and the occasional
error as the push occurs.
