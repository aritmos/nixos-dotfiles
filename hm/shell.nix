#[home-manager]
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
      # TODO: move to wsl config
      xdg-open = "wsl-open";
      lj = "lazyjj";
    };

    # emacs-style binds (vi is annoying)
    initContent = ''
      bindkey -e
    '';
  };

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
