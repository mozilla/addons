Repositories
============

mozilla-central
---------------

Browser code is maintained in mozilla-central. This includes several areas related to add-ons. All of the following bug trackers are in Bugzilla:

Add-ons Manager
~~~~~~~~~~~~~~~
Handles installing, running and updating add-ons within the application (eg: Firefox). Also has pages like about:addons. In bugzilla - product: Toolkit, component: Add-ons Manager. `Existing bugs <https://bugzilla.mozilla.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=Add-ons%20Manager&product=Toolkit>`__ or `file a new bug <https://bugzilla.mozilla.org/enter_bug.cgi?product=Toolkit&component=Add-ons%20Manager>`__.

WebExtensions
~~~~~~~~~~~~~
An API for building add-ons that works with e10s and is compatible with Google Chrome. In bugzilla - product: Toolkit, component: WebExtensions. `Existing bugs <https://bugzilla.mozilla.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&component=WebExtensions&product=Toolkit>`_ or `file a new bug <https://bugzilla.mozilla.org/enter_bug.cgi?product=Toolkit&component=WebExtensions>`_. Documentation `on MDN <https://developer.mozilla.org/docs/Mozilla/Add-ons/WebExtensions>`_.

GitHub
------

Almost everything else is on GitHub and issues are tracked in GitHub. This is a non-exhaustive list. Other repositories and libraries do appear around these main repositories:

addons
~~~~~~
`These docs <https://mozilla.github.io/addons/>`__ and an issue tracker. `This repository <https://github.com/mozilla/addons>`__ serves as an umbrella for everything add-ons.
Bug tracker is in GitHub and can be used for almost anything add-ons related. `Existing issues <https://github.com/mozilla/addons/issues/>`__.

addons-frontend
~~~~~~~~~~~~~~~~~~~
The `addons.mozilla.org <https://addons.mozilla.org/>`__ website. The `repository <https://github.com/mozilla/addons-frontend>`__ is on GitHub.

addons-server
~~~~~~~~~~~~~
Complement to addons-frontend, this contains API, Developer Hub, Reviewer Tools and Admin Tools for AMO. The `repository <https://github.com/mozilla/addons-server>`__ is on GitHub. Documentation is `on GitHub pages <https://mozilla.github.io/addons/>`__.

In the past this repository has been known as *remora*, *zamboni* or *olympia*.

addons-blog
~~~~~~~~~~~
Static content generator for AMO's blog, `addons.mozilla.org/blog <https://addons.mozilla.org/blog/>`__.

addons-linter
~~~~~~~~~~~~~
The linter checks WebExtensions for common errors and potential problems. It is used on `addons.mozilla.org <https://addons.mozilla.org/>`__ and `web-ext <https://github.com/mozilla/web-ext/>`__. It can also be run in stand-alone mode. The `repository <https://github.com/mozilla/addons-linter>`__, `issue tracker <https://github.com/mozilla/addons-linter/issues/>`__ and `documentation <https://mozilla.github.io/addons-linter/>`__ is on GitHub.

web-ext
~~~~~~~
This is a command line tool to help build, run, and test `WebExtensions <https://developer.mozilla.org/docs/Mozilla/Add-ons/WebExtensions>`__. The `repository <https://github.com/mozilla/web-ext>`__ and `issue tracker <https://github.com/mozilla/web-ext/issues/>`__ is on GitHub. The `documentation <https://extensionworkshop.com/documentation/develop/getting-started-with-web-ext/>`__ and `command reference <https://extensionworkshop.com/documentation/develop/web-ext-command-reference>`__ is on Extension Workshop.

extension-workshop
~~~~~~~~~~~~~~~~~~
Extension Workshop is a launchpad for building Firefox extensions. It contains resources about development, publication and management of WebExtensions. The `repository <https://github.com/mozilla/extension-workshop>`__ and `issue tracker <https://github.com/mozilla/extension-workshop/issues/>`__ is on GitHub.
