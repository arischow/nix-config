{ pkgs, ... }:
{
  imports = [
    ./rust.nix
  ];
  home.packages = with pkgs; [
    python310Packages.cython_3
  ];
}
