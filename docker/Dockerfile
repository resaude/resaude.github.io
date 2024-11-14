FROM nixos/nix:2.25.1 AS os

COPY .config /root/.config
# Prevent conflict between home-manager and nix-profile
RUN nix profile remove --impure man-db wget
RUN nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
RUN nix-channel --update
RUN nix-shell '<home-manager>' -A install

RUN home-manager switch

WORKDIR /workdir

ENTRYPOINT ["zsh"]
