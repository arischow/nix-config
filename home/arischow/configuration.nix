{ lib, config, pkgs, inputs, ... }:

{
  system.stateVersion = 5;
  ids.gids.nixbld = 30000;
  nixpkgs.config.allowUnfree = true;
  nix.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;
  programs.fish.enable = true;
  programs.fish.useBabelfish = true;

  system.primaryUser = "arischow";
  homebrew.enable = true;
  homebrew.onActivation = {
    # Keep `make apply` idempotent: don't pull new brew versions as a side
    # effect of applying config changes. Upgrades happen via `make upgrade`.
    autoUpdate = false;
    cleanup = "uninstall"; # This uninstalls all formulae not listed in generated Brewfile
    upgrade = false;
  };
  # If you can do it on the home-manager, don't do it here.
  # If it *really* doesn't work on the home-manager, consider submitting a PR :)
  homebrew.taps = [
    { name = "terraform-linters/tap"; trusted = true; }
    { name = "terraform-docs/tap"; trusted = true; }
  ];
  homebrew.brews = [
    "black"
    "mysql-client"
    "gettext"
    "lasso"
    "asciinema"
    "svn"
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

    # python "mysqlclient" package (also needs mysql-client, listed above)
    "pkgconfig"

    "terraform-docs"
  ];
  homebrew.casks = [
    "raycast"
    "orbstack"
    "keycastr"
    "1password-cli"
    "betterdisplay"
    "ghostty" # Terminal emulator
    "tflint"
  ];
}
