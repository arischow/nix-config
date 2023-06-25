{ pkgs, ... }: {
  imports = [
    ./autojump.nix
    ./bat.nix
    ./direnv.nix
    ./exa.nix
    ./fzf.nix
    ./git.nix
    ./starship.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    ncdu
    nixpkgs-fmt
  ];
}
