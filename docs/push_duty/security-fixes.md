# Security fixes

Security issues against AMO are currently reported in Bugzilla. When someone is
assigned to work on one, they should open a new draft security advisory
describing the security issue and linking to the bugzilla bug, but not publish
it. That unlocks the ability to have a private PR and fork to work on the
issue.

The corresponding private PR should is reviewed as normal but once it has been
reviewed, it should *not* be merged right away. Instead, it should be called
out in the release notes for the next release. Merging to ``master`` is part
of push duty and happens right before tagging, using GitHub regular merge
functionality on the PR. The advisory can then be closed (it's never
published).
