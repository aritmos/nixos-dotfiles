{ config, pkgs, lib, inputs, ...}:

let 
  # TODO: make the config user agnostic
  user = "nixos";
  secrets = import "/home/${user}/.secret.nix";
in
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs secrets; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${user}" = import ./home.nix;
  };
}
