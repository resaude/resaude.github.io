set shell := ["zsh", "-uc"]

devenv:
    pre-commit install
    pre-commit install-hooks

build:
    rm -rf build
    sphinx-build source build -b html

run-server:
    python -m http.server -d build
