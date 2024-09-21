{ catppuccin, ... }: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.arischow = {
    imports = [
      catppuccin.homeManagerModules.catppuccin
      ./mbp.nix
    ];
  };
  users.users.arischow.home = "/Users/arischow";
}

