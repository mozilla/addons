AMO v3
======

The next rewrite of AMO.

Status: first draft.

Why?
----

* A large amount of technical debt.
* Olympia is a rewrite of remora, aiming at feature parity, then with a bunch of additions.
* Features have been growing until the complexity is becoming a challenge.
* The development world has changed a lot since the original creation (9 years ago).
* The development world has changed a log since the rewrite (5 years ago).

Goals for the rewrite:

* Provide a great user experience.
* Provide a developer flow that optimises developer experience, integrating with external tools.
* Improve the discovery of add-ons.
* Improve velocity of development.

For features, we should follow the great or dead plan with some guidance:

* Is the feature useful?
* Is the feature used?
* Is it required?
* Is there a simpler alternative?

Projects
--------

JS Validator
++++++++++++

Currently the Add-on Validator is written in Python and utilizes spidermonkey.
It's been a goal for a long time to get the validator closer to the developers.
That means having it runnable in the browser, perhaps in the Firefox developer
tools.

Engineering team:

Tracking bugs:

More details:

Metrics
+++++++

Any re-write involves two stages. Figuring out what features are used and then
testing the newly implemented features to see if they perform as well as the
existing features.

As an example, we can run the v1 Add-on Validator (Python) at the same time as
the v2 Add-on Validator (JavaScript) and key metrics should match before we
switch over to the new version.

Engineering team:

Tracking bugs:

More details:

Roadmap
-------

* Sep 2015
    * Start the validator rewrite into JS.
    * Start the metrics project.
    * Compile a list of features and tools currently present on AMO.
* Oct 2015
    * Requirements gathering from the various teams eg: users, reviewers, product, developers.
    * Technical planning
