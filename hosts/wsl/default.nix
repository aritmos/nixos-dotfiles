{ config, pkgs, inputs, ...}:

let
  wslFlake = builtins.getFlake (toString ./flake.nix);
in
{
  imports = [
    ./hardware-configuration.nix
    # special configurations (created by WSL)
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";
}
