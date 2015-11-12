This is the general root for add-ons at Mozilla.

Documentation? See: https://addons.readthedocs.org

If you want to contribute to the docs, here's how to set up a development
environment.

Using [Python](https://www.python.org/)
and optionally [virtualenv](https://virtualenv.pypa.io/en/latest/),
install the dependencies:

    pip install -r requirements/docs.txt

Make some changes then build the docs:

    make -C docs/ html

Open `docs/_build/html/index.html` to preview your changes before creating a
pull request.
