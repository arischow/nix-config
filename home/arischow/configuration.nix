{ lib, config, pkgs, inputs, ... }:

{
  system.stateVersion = 5;
  ids.gids.nixbld = 30000;
  nixpkgs.config.allowUnfree = true;
  nix.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;
  programs.fish.enable = true;

  system.primaryUser = "arischow";
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
    "mysql-client"
    "gettext"
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
    "docker-credential-helper-ecr"

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
    "jfrog-cli"

    # pyenv dependencies
    # https://github.com/pyenv/pyenv/wiki
    "pyenv"
    "openssl"
    "readline"
    "sqlite3"
    "xz"
    "tcl-tk"
    "libb2"
    "zstd"
    "zlib"

    # python "mysqlclient" package
    "mysql-client"
    "pkgconfig" # also pyenv
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
