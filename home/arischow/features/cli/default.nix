{ pkgs, ... }: {
  imports = [
    ./autojump.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./jq.nix
    ./ripgrep.nix
    ./starship.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    k9s
    ncdu
    nixpkgs-fmt
    thefuck
    tldr
    pipx
    yamllint
    protobuf
    curlHTTP3
  ];
}
