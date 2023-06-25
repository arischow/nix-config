{
  description = "My NixOS configuration";

  inputs = {
    master.url = "github:nixos/nixpkgs/master";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager = {
      url = "github:nix-community/home-manager";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = {
      Ariss-MacBook-Pro = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./home/arischow/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.arischow = import ./home/arischow/mbp.nix;
            users.users.arischow.home = "/Users/arischow";
          }
        ];
      };
    };
  };
}
