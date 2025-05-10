{ config, pkgs, lib, inputs, ...}:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users."nixos" = import ./home.nix;
  };
  
  # TODO: move to its own `shell` config file
}
