# [home-manager]
{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      # TODO: add lang configs after they are installed
      format = "$directory $fill $cmd_duration $git_metrics$git_branch$line_break$character";
      fill.symbol = " ";
      cmd_duration.format = "[$duration](bold grey)";
      git_metrics = {
        disabled = false;
        added_style = "bold blue";
      };
      git_branch.symbol = " ";
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };
    };
  };
}  
