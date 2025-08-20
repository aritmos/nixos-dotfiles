# [home-manager]
{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./programs
    ./shell.nix
  ];

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    home-manager

    # --- utils
    ripgrep
    tree
    just
    lazygit
    eza
    tokei
    rsync

    # --- apps
    typst

    # --- productivity
    zellij

    # --- nixos
    nix-search-cli

    # --- coding
    gh
    jujutsu
    lazyjj
    codecrafters-cli

    # rust (via fenix)
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer-nightly
    bacon

    # c / c++
    gcc

    # python
    python313
    python313Packages.python-lsp-server
    pyright

    # go
    go
    gopls

    # zig
    zig
    zls

    # lua
    lua-language-server

    # typst
    tinymist

    # misc
    openssl
    pkg-config

    # --- misc
    starship
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
