{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {
      inherit inputs;
      sysConfig = config;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users."nixos" = import ./home.nix;
  };
  
  # TODO: move to its own `shell` config file
  programs.zsh = {
    enableCompletion = true;
    shellAliases = {
      c = "clear";
    };

    shellInit = ''
      update() {
	sudo nixos-rebuild switch --flake ~/.nixos#"$1"
      }
    '';
  };
  system.userActivationScripts.zshrc = "touch .zshrc";
}
