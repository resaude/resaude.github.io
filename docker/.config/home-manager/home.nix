{ pkgs, config, ... }:
{
  home.stateVersion = "24.11";
  home.username = "root";
  home.homeDirectory = "/root";
  home.packages = with pkgs; [
    neovim
    vim
    wget
    zsh
    zsh-history
    zsh-autosuggestions
    zsh-autocomplete
    nix-direnv
    direnv
    bat
    gh
  ];

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "history"
        "git"
      ];
      theme = "robbyrussell";
    };
  };
}
