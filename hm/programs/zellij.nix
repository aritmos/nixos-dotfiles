# [home-manager]
{ config, lib, pkgs, ...}:

{
  programs.zellij = {
    enable = true; 
    settings = {
      simplified_ui = true;
      pane_frames = false;
      themes.one-half-dark-custom = {
        bg = "#282c34";
        fg = "#dcdfe4";
        white = "#dcdfe4";
        cyan = "#56b6c2";
        magenta = "#c678dd";
        blue = "#61afef";
        yellow = "#e5c07b";
        green = "#98c379";
        red = "#e06c75";
        black = "#282c34";
        orange = "#ea9a97";
      };
      theme = "one-half-dark-custom";
    };
  };
}
