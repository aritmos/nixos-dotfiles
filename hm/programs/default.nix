# [home-manager]
{ config, lib, pkgs, ...}:

{
  imports = [
    ./neovim
    ./git.nix
    ./zellij.nix
    ./starship.nix
  ];

  # small program configs go here. 
  # if they grow too large they get moved to their own file

  programs.eza = {
    enable = true;
  };

}
