#!/usr/bin/env bash
# Set up the Nix environment with docker

docker build $(dirname "$0") --tag resaude-dev
docker run \
    -p 8000:8000 -it \
    -v $(dirname "$0")/..:/workdir \
    -v "$HOME/.gitconfig:/etc/gitconfig" \
    -v "$HOME/.git-credentials:/root/.git-credentials" \
    -v "$HOME/.ssh:/root/.ssh" \
    resaude-dev
