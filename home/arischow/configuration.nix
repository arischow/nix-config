{ lib, config, pkgs, inputs, ... }:

{
  system.stateVersion = 5;
  ids.gids.nixbld = 30000;
  nixpkgs.config.allowUnfree = true;
  nix.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;
  programs.fish.enable = true;

  homebrew.enable = true;
  homebrew.onActivation = {
    autoUpdate = true;
    cleanup = "uninstall"; # This uninstalls all formulae not listed in generated Brewfile
    upgrade = true;
  };
  # If you can do it on the home-manager, don't do it here.
  # If it *really* doesn't work on the home-manager, consider submitting a PR :)
  homebrew.brews = [
    "black"
    "pyenv"
    "mysql-client"
    "gettext"
    "zlib"
    "openssl"
    "lasso"
    "asciinema"
    "svn"
    "lasso"
    "libsodium"
    "exercism"
    "smartmontools"
    "iperf3"
    "gawk"
    "pgcli"

    # infra-related
    "conftest"
    "helm"
    "jsonnet-bundler" # jb
    "jsonnet"
    "kustomize"
    "opa"
    "pluto"
    "tanka" # tk
    "yq"
  ];
  homebrew.casks = [
    "raycast"
    "orbstack"
    "keycastr"
    "1password-cli"
    "betterdisplay"
    "ghostty" # Terminal emulator
  ];
}
