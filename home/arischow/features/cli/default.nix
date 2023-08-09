{ pkgs, ... }: {
  imports = [
    ./autojump.nix
    ./bat.nix
    ./direnv.nix
    ./exa.nix
    ./fzf.nix
    ./git.nix
    ./jq.nix
    ./starship.nix
    ./zsh.nix 
  ];

  home.packages = with pkgs; [
    k9s
    ncdu
    nixpkgs-fmt
  ];
}
