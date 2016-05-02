# Mozilla Add-ons

This is the general root project for add-ons at Mozilla.

## Filing bugs

If you're looking to file a bug relating to the addons.mozilla.org (AMO)
website then please [file an issue on this project](https://github.com/mozilla/addons/issues/new).

## Documentation

This project contains general documentation relating to the Add-ons project.
[You can view the docs here](https://addons.readthedocs.io).

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
