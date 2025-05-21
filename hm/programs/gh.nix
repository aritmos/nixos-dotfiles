# [home-manager]
{ config, lib, pkgs, ... }:

let
  user = config.home.username;
  configDir = config.xdg.configHome;
in
{
  home.file."${configDir}/gh/hosts.yml" = {
    source = builtins.toPath "/home/${user}/.secrets/gh/hosts.yml";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
