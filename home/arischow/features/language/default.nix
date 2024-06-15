{ pkgs, ... }:
{
  imports = [
    ./rust.nix
  ];
  home.packages = with pkgs; [
    python311Packages.cython
  ];
}
