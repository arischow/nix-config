{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.arischow = import ./mbp.nix;
  users.users.arischow.home = "/Users/arischow";
}
