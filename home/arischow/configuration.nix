{ pkgs, inputs, ... }:

{
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  homebrew = {
    enable = true;
  };

  # If you can do it on the home-manager, don't do it here.
  # If it *really* doesn't work on the home-manager, consider submitting a PR :)
  homebrew.brews = [
    "poetry"
  ];
}