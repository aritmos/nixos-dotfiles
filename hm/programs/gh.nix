# [home-manager]
{ config, lib, pkgs, secrets, ... }:

{
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    hosts."github.com" = {
      users.aritmos.oauth_token = secrets.ghToken;
      git_protocol = "https";
      oauth_token = secrets.ghToken;
      user = "aritmos";
    };
  };
}
