set shell := ["zsh", "-uc"]

devenv:
    pre-commit install

build:
    sphinx-build source build -b html
