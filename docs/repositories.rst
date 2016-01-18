Repositories
============

mozilla-central
---------------

Browser code is maintained in the mozilla-central. This includes several areas, related to addons. All of the following bug trackers are in Bugzilla:

Addons manager
~~~~~~~~~~~~~~
Handles installing, running and updating add-ons within the application (eg: Firefox). Also has pages like about:addons. In bugzilla - product: Toolkit, component: Add-ons Manager. `Existing bugs <https://bugzilla.mozilla.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=Add-ons%20Manager&product=Toolkit>`_ or `file a new bug <https://bugzilla.mozilla.org/enter_bug.cgi?product=Toolkit&component=Add-ons%20Manager>`_.

Add-on SDK
~~~~~~~~~~
A library and SDK for building extensions. In bugzilla - product: Add-on SDK. `Existing bugs <https://bugzilla.mozilla.org/buglist.cgi?&bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&product=Add-on%20SDK>`_ or `file a new bug <https://bugzilla.mozilla.org/enter_bug.cgi?product=Add-on%20SDK>`_. Documentation `on MDN <https://developer.mozilla.org/en-US/Add-ons/SDK>`_.

WebExtensions
~~~~~~~~~~~~~
An API for building add-ons that works with e10s and is compatible with Google Chrome. In bugzilla - product: Toolkit, component: WebExtensions. `Existing bugs <https://bugzilla.mozilla.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=WebExtensions&product=Toolkit>`_ or `file a new bug <https://bugzilla.mozilla.org/enter_bug.cgi?product=Toolkit&component=WebExtensions>`_. Documentation `on MDN <https://developer.mozilla.org/en-US/Add-ons/WebExtensions/>`_.

github
------

Almost everything else is on github and issues are tracked in github. This is a non-exhaustive list. Other repositories and libraries do appear around these main libraries:

addons
~~~~~~
`These docs <https://addons.readthedocs.org>`_ and an issue tracker. `This repository <https://github.com/mozilla/addons>`_ serves as an umbrella for everything add-ons.
Bug tracker is in github and can be used for almost anything add-ons related. `Existing bugs <https://github.com/mozilla/addons/issues/>`_.

olympia
~~~~~~~
The `addons.mozilla.org <https://addons.mozilla.org>`_ website. The `repository <https://github.com/mozilla/olympia>`_ is on github. The preferred bug tracker is `github <https://github.com/mozilla/olympia/issues/>`_ although components do exist on bugzilla for legacy bugs. Documentation is `on readthedocs <https://olympia.readthedocs.org>`_.

amo-validator
~~~~~~~~~~~~~
The legacy Python version of the validator for the `addons.mozilla.org <https://addons.mozilla.org>`_ website. The `repository <https://github.com/mozilla/amo-validator>`_ is on github. The preferred bug tracker is `github <https://github.com/mozilla/amo-validator/issues/>`_ although components do exist on bugzilla for legacy bugs. Documentation is `on readthedocs <https://olympia.readthedocs.org>`_.

addons-linter
~~~~~~~~~~~~~
The new JavaScript version of the validator for the `addons.mozilla.org <https://addons.mozilla.org>`_ website. The `repository <https://github.com/mozilla/addons-linter>`_ is on github. The bug tracker is `github <https://github.com/mozilla/addons-linter/issues/>`_. Documentation is `on readthedocs <https://olympia.readthedocs.org>`_. See also `dispensary <https://github.com/mozilla/dispensary>`_.

jpm
~~~
Command line client for creating SDK add-ons. The `repository <https://github.com/mozilla-jetpack/jpm>`_ is on github. The bug tracker is `github <https://github.com/mozilla-jetpack/jpm/issues/>`_. Documentation is `on MDN <https://developer.mozilla.org/en-US/Add-ons/SDK/Tutorials/Getting_Started_%28jpm%29>`_. See also `jpm core <https://github.com/mozilla-jetpack/jpm-core>`_ and `jpm mobile <https://github.com/mozilla-jetpack/jpm-mobile>`_.

The following repository exists on github, but should bugs and code should go into mozilla-central: `add-on SDK <https://github.com/mozilla/addon-sdk>`_.
