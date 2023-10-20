{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, nixvim, ... }: {
    darwinConfigurations = {
      Ariss-MacBook-Pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./home/arischow/configuration.nix
          home-manager.darwinModules.home-manager
          ./home/arischow/home-manager.nix
          nixvim.nixDarwinModules.nixvim
          ./home/arischow/nixvim.nix
        ];
      };
    };
  };
}
