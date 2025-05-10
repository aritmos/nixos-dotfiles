{ config, lib, pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      # general
      c = "clear";
      # nixos
      update = "sudo nixos-rebuild switch --flake ~/.nixos#$1";
    };
  };
}
