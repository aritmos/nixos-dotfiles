{ config, pkgs, inputs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    # special configurations (created by WSL)
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  environment.systemPackages = with pkgs; [
    wsl-open
  ];
}
