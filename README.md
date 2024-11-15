# Mozilla Add-ons

This is the general root project for add-ons at Mozilla.

## Filing bugs

If you're looking to file a bug relating to the addons.mozilla.org (AMO)
website then please [file an issue on this project](https://github.com/mozilla/addons/issues/new).

## Security Bug Reports

The associated production website at addons.mozilla.org is included in Mozilla’s web and services [bug bounty program]. If you find a security vulnerability, please submit it via the process outlined in the program and [FAQ pages]. Further technical details about this application are available from the [Bug Bounty Onramp page].

Please submit all security-related bugs through Bugzilla using the [web security bug form].

Never submit security-related bugs through a Github Issue or by email.

  [bug bounty program]: https://www.mozilla.org/en-US/security/web-bug-bounty/
  [FAQ pages]: https://www.mozilla.org/en-US/security/bug-bounty/faq-webapp/
  [Bug Bounty Onramp page]: https://wiki.mozilla.org/Security/BugBountyOnramp/
  [web security bug form]: https://bugzilla.mozilla.org/form.web.bounty

## Documentation

This project contains general documentation relating to the Add-ons project.
[You can view the docs here](https://mozilla.github.io/addons/).

If you would like to contribute to the docs, here's how to set up a development
environment:

Using [Python](https://www.python.org/)
and optionally [virtualenv](https://virtualenv.pypa.io/en/latest/),
install the dependencies:

    pip install -r requirements/docs.txt

Make some changes then build the docs:

    make -C docs/ html

Open `docs/_build/html/index.html` to preview your changes before creating a
pull request.
