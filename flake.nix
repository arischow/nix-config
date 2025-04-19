{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:nix-darwin/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, nixvim, catppuccin, ... }: {
    darwinConfigurations = {
      Ariss-MacBook-Pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = inputs;
        modules = [
          ./home/arischow/configuration.nix
          home-manager.darwinModules.home-manager
          ./home/arischow/home-manager.nix
          nixvim.nixDarwinModules.nixvim
          ./home/arischow/features/neovim/default.nix
        ];
      };
    };
  };
}
