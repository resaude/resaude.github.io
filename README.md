Aud'Octet Web Site

# Development

To add changes, you have to use [Nix](https://nixos.org/) and [Direnv](https://github.com/nix-community/nix-direnv),
this will setup en entire development environment.

Then, you can modify `markdown` content in `source` and test the result with:
- `just build`: that will build html content
- `just run-server`: that will expose a local http server to [`localhost:8000`](http://localhost:8000)
