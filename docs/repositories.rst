Repositories
============

mozilla-central
---------------

Browser code is maintained in mozilla-central. This includes several areas related to add-ons. All of the following bug trackers are in Bugzilla:

Add-ons manager
~~~~~~~~~~~~~~~
Handles installing, running and updating add-ons within the application (eg: Firefox). Also has pages like about:addons. In bugzilla - product: Toolkit, component: Add-ons Manager. `Existing bugs <https://bugzilla.mozilla.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=Add-ons%20Manager&product=Toolkit>`__ or `file a new bug <https://bugzilla.mozilla.org/enter_bug.cgi?product=Toolkit&component=Add-ons%20Manager>`__.

WebExtensions
~~~~~~~~~~~~~
An API for building add-ons that works with e10s and is compatible with Google Chrome. In bugzilla - product: Toolkit, component: WebExtensions. `Existing bugs <https://bugzilla.mozilla.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=WebExtensions&product=Toolkit>`_ or `file a new bug <https://bugzilla.mozilla.org/enter_bug.cgi?product=Toolkit&component=WebExtensions>`_. Documentation `on MDN <https://developer.mozilla.org/en-US/Add-ons/WebExtensions/>`_.

GitHub
------

Almost everything else is on GitHub and issues are tracked in GitHub. This is a non-exhaustive list. Other repositories and libraries do appear around these main libraries:

addons
~~~~~~
`These docs <https://addons.readthedocs.io>`__ and an issue tracker. `This repository <https://github.com/mozilla/addons>`__ serves as an umbrella for everything add-ons.
Bug tracker is in GitHub and can be used for almost anything add-ons related. `Existing bugs <https://github.com/mozilla/addons/issues/>`__.

addons-server
~~~~~~~~~~~~~
The `addons.mozilla.org <https://addons.mozilla.org>`__ website. The `repository <https://github.com/mozilla/addons-server>`_ is on GitHub. The preferred bug tracker is `github <https://GitHub.com/mozilla/addons-server/issues/>`__ although components do exist on bugzilla for legacy bugs. Documentation is `on readthedocs <https://addons-server.readthedocs.io>`__.

In the past this repository has been known as *remora*, *zamboni* or *olympia*.

amo-validator
~~~~~~~~~~~~~
The legacy Python version of the validator for the `addons.mozilla.org <https://addons.mozilla.org>`__ website. The `repository <https://github.com/mozilla/amo-validator>`__ is on GitHub. The preferred bug tracker is `GitHub <https://github.com/mozilla/amo-validator/issues/>`__ although components do exist on bugzilla for legacy bugs. Documentation is `on readthedocs <https://addons-server.readthedocs.io>`__.

addons-linter
~~~~~~~~~~~~~
The new JavaScript version of the validator for the `addons.mozilla.org <https://addons.mozilla.org>`__ website. The `repository <https://github.com/mozilla/addons-linter>`__ is on GitHub. The bug tracker is `GitHub <https://github.com/mozilla/addons-linter/issues/>`__. Documentation is `on readthedocs <https://addons-server.readthedocs.io>`__. See also `dispensary <https://github.com/mozilla/dispensary>`__.

jpm
~~~
Command line client for creating SDK add-ons. The `repository <https://github.com/mozilla-jetpack/jpm>`__ is on GitHub. The bug tracker is `GitHub <https://github.com/mozilla-jetpack/jpm/issues/>`__. Documentation is `on MDN <https://developer.mozilla.org/en-US/Add-ons/SDK/Tutorials/Getting_Started_%28jpm%29>`__. See also `jpm core <https://github.com/mozilla-jetpack/jpm-core>`__ and `jpm mobile <https://github.com/mozilla-jetpack/jpm-mobile>`__.

The following repository exists on GitHub, but should bugs and code should go into mozilla-central: `add-on SDK <https://github.com/mozilla/addon-sdk>`__.
