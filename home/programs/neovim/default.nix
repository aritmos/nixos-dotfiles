# [home-manager]
{ config, pkgs, sysConfig, ... }:

let
  packpathDirs = pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs; 
  mapPackpathDirs = initLua: 
    (builtins.replaceStrings ["{{PACKPATH_DIRS}}"] [(builtins.toString packpathDirs)] initLua);
in
{
  home.file."${config.xdg.configHome}/nvim/lua" = {
    source = ./lua;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim

      # editor
      leap-nvim
      flit-nvim
    ];

    extraLuaConfig = mapPackpathDirs (builtins.readFile ./init.lua);
  };
}
