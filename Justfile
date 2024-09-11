set shell := ["zsh", "-uc"]

devenv:
    pre-commit install

build:
    rm -rf build
    sphinx-build source build -b html
