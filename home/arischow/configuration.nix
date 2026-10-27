{ lib, config, pkgs, inputs, ... }:

{
  system.stateVersion = 5;
  ids.gids.nixbld = 30000;
  nixpkgs.config.allowUnfree = true;
  nix.enable = false;
  security.pam.services.sudo_local.touchIdAuth = true;
  programs.fish.enable = true;
  programs.fish.useBabelfish = true;
  programs._1password.enable = true;

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
  homebrew.brews = [
    "mysql-client"
    "gettext"
    "lasso"
    "libsodium"

    # python "mysqlclient" package (also needs mysql-client, listed above)
    "pkgconfig"
  ];
  homebrew.casks = [
    "raycast"
    "orbstack"
    "keycastr"
    "betterdisplay"
    "ghostty" # Terminal emulator
  ];
}
