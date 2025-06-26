# [home-manager]
{ config, lib, pkgs, inputs, secrets, ...}:

{
  imports = [
    ./gh.nix
    ./git.nix
    ./neovim
    ./starship.nix
    ./zellij.nix
  ];

  # small program configs go here. 
  # if they grow too large they get moved to their own file

  programs.eza = {
    enable = true;
  };
}
