{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./haskell.nix
    ./rust.nix
  ];
  home.packages = with pkgs; [
    python311Packages.cython
  ];
}
