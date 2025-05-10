{
  description = "Nixos config flake";

  inputs = {
    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    nixvim = {
#      url = "github:nix-community/nixvim";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }@inputs: {
    nixosConfigurations = {
      wsl = nixpkgs.lib.nixosSystem {
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/wsl
	  ./system
	  ./home 
	];
      };
    };
  };
}
