Res'Aude Web Site

# Development

## Setup

### Nix install

You have to install [Nix](https://nixos.org/), and then installing  [Direnv](https://github.com/nix-community/nix-direnv): `nix profile install nixpkgs#direnv nixpkgs#nix-direnv`
this will setup en entire development environment.

> **__Note__**: to enable `direnv`, follow [the direnv setup page](https://direnv.net/docs/hook.html)

> **__Warning__**: if you have an error about "experimental Nix feature", you have to create the file `~/.config/nix/nix.conf` with the following content: `extra-experimental-features = nix-command flakes`.

### Docker install

A full docker container environment can be built and used with following script:
`bash ./docker/docker-env.sh`

## Usage

Then, you can modify `markdown` content in `source` and test the result with:
- `just build`: that will build html content
- `just run-server`: that will expose a local http server to [`localhost:8000`](http://localhost:8000)
- commands can be combine: `just build run-server`

# To add a new member description

You have to create:
- a new file in `source/members` with an explicit name
- then copy-past the following structure and complete `<>` placeholder:
```md
    ```{dropdown}<Name>

    :::{image} <Image>
    :width: 175
    :align: right
    :::

    - 💻: <Poste>
    - ❇️: <Short description>
    - ☘️: `<mentra>`
    - 🛠️: <Competences>

    :::{dropdown} Qui est-ce ?

    <Description>
    :::

    :::{dropdown} Réalisation

    <What have you already done>
    :::

    :::{dropdown} Contact

    {far}`envelope` Adresse mail: <E-mail>

    {fab}`github` Github: <Github pages>

    {fab}`gitlab` Gitlab: <GitLab pages>

    {fab}`linkedin` Linkedin: <Linkedin>

    🌐 Site Web: <Web-Site>
    :::
    ```
```
- remember to reference your page in `source/members/index.md`:
```
    ```{include} ./<your-page-name>.md
    ```
```
