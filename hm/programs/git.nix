# [home-manager]
{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "aritmos";
    userEmail = "";

    extraConfig = {
      column.ui = "auto";
      branch.sort = "-commiterdate";
      tag.sort = "version:refname";
      init.defaultBranch = "main";
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      push = {
        default = "simple";
        followTags = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };

      # "maybe" settings
      help.autocorrect = "prompt";
      commit.verbose = true;
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      # TODO: setup global gitignore
      # core.excludesfile = "${xdg.configDir}/git/.gitignore"
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRegs = true;
        rebase = true;
      };
    };
  };
}
