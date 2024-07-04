{ pkgs, ... }:
{
  imports = [
    ./haskell.nix
    ./rust.nix
  ];
  home.packages = with pkgs; [
    python311Packages.cython
  ];
}
