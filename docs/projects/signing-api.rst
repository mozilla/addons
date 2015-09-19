Signing API
===========

Currently there is no API to sign new add-ons or add in new versions to be signed.

API requirements
----------------

Main goals:

* Create an add-on and create a new version through APIs
* Ability to poll an API for status
* (optional) Ability to receive notification when complete
* Ability to access signed file, if signing completes

All the standard API stuff:

* Appropriate auth (no need for anonymous)
* Clear API versioning
* REST and JSON
* Accepts form data
* Clear errors
* Fast
* Well documented
* No surprises

Scope
-----

We need to focus on the submission flow to assist the signing queue. The AMO api
can theoretically covers everything in the developer hub, e.g.: validation, editing
etc.

Until we have a clearer idea of the rewrite and back-end we should probably
think about it more.

Examples
--------

Note: All URLs, headers and so on are subject to change during development. And decent URLs are hard.

Create addon by a POST with file::

	curl -H "Auth-Token: ...." --data @some.v0.xpi https://a.m.o/api/v3/addon/

Poll for status::

	curl -H "Auth-Token: ...." https://a.m.o/api/v3/status/some-addon/

Get signed version::

	curl https://amo/addon/some-addon/versions/0.1-signed.xpi

Upload new version with file::

	curl -H "Auth-Token: ...." --data @some.v1.xpi https://a.m.o/api/v3/version/some-addon/


Key clients
-----------

We are going to have some key clients that we are needing to target for this API. For example:

* TravisCI: each time a build passes, upload a new version of the add-on
* cURL: it should be possible to do an upload, with something as simple as cURL (ideally we won't need to write a full client library like npm or setuptools)
* (optional) Firefox Developer tools: enuf' said

Rewrite
-------

We need to rewrite the back-end and we'll be proceeding with that in amo-v3. The
API interface *should not change*, it should remain consistent as much as possible.

By having a consistent API we can swap out the back end as the newer one becomes
available.
