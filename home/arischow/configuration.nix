{ lib, config, pkgs, inputs, ... }:

{
  system.stateVersion = 5;
  nixpkgs.config.allowUnfree = true;
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  programs.fish.enable = true;

  homebrew.enable = true;
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
    "orbstack"
    "keycastr"
    "1password-cli"
    "jordanbaird-ice" # bar tray manager
    "balenaetcher" # burn ISOs to a bootable USB.
  ];
}
