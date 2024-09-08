{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem =
        { pkgs, system, ... }:
        let
          python = pkgs.python312;
        in
        {
          devShells = {
            default = pkgs.mkShell {
              # The Nix packages provided in the environment
              packages = with pkgs; [
                # Python plus helper tools
                (python.withPackages (
                  ps: with ps; [
                    virtualenv
                    pip
                    tox
                    sphinx
                  ]
                ))
                just
                git
                pre-commit
                commitizen
                openssh

                # to build nixfmt
                cabal-install
                ghc
              ];
              shellHook = ''
                just devenv
                source .venv/bin/activate
              '';
            };
          };
        };
    };
}
