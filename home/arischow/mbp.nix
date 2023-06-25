{ config, pkgs, ... }:

{
  imports = [
    ./global
  ];
  home.packages = with pkgs; [
    thefuck  # `fuck`
  ];
}
