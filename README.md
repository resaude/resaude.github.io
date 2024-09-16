Aud'Octet Web Site

# Development

To add changes, you have to use [Nix](https://nixos.org/) and [Direnv](https://github.com/nix-community/nix-direnv),
this will setup en entire development environment.

Then, you can modify `markdown` content in `source` and test the result with:
- `just build`: that will build html content
- `just run-server`: that will expose a local http server to [`localhost:8000`](http://localhost:8000)

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
