{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pyproject-nix.url = "github:nix-community/pyproject.nix";
    pyproject-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      pyproject-nix,
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
          sphinx-favicon-project = pyproject-nix.lib.project.loadPyproject {
            projectRoot = pkgs.fetchFromGitHub {
              owner = "tcmetzger";
              repo = "sphinx-favicon";
              rev = "e7380e0";
              sha256 = "sha256-Arcjj+6WWuSfufh8oqrDyAtjp07j1JEuw2YlmFcfL3U=";
            };
          };
          sphinx-favicon-attrs = sphinx-favicon-project.renderers.buildPythonPackage { inherit python; };
          sphinx-favicon = python.pkgs.buildPythonPackage (sphinx-favicon-attrs);
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
                    myst-parser
                    furo
                    sphinx-copybutton
                    sphinx-design
                    sphinx-favicon
                    sphinx-inline-tabs
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
