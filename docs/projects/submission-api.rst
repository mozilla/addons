Submission API
==============

Currently there is no API to submit new add-ons or add in new versions.

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

Create addon by a POST with file::

	curl -H "Auth-Token: ...." --file some.v0.xpi http://a.m.o/api/v3/addon/

Poll for status::

	curl -H "Auth-Token: ...." http://a.m.o/api/v3/status/some-addon/

Upload new version with file::

	curl -X POST -H "Auth-Token: ...." --file some.v1.xpi http://a.m.o/api/v3/version/some-addon/

Note: Decent URLs are hard.

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
