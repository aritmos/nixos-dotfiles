{ config, lib, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      c = "clear";
      lg = "lazygit";
      zj = "zellij";
      ls = "eza";
      lsa = "ls -lah";
      py = "python3";
      xdg-open = "wsl-open";
    };
  };

}
