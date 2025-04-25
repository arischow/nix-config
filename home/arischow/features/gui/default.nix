{ pkgs, ... }: {
  imports = [
# Sadly, it's not possible to build ghostty purely from Nix for now:
# https://github.com/NixOS/nixpkgs/issues/388984
#    ./ghostty.nix
  ];
}
