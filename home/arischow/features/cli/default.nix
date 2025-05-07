{ pkgs, ... }: {
  imports = [
    ./autojump.nix
    ./aws.nix
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./eza.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./github.nix
    ./jq.nix
    ./k9s.nix
    ./lazygit.nix
    ./ripgrep.nix
    ./starship.nix
    ./thefuck.nix
    ./tmux.nix
    ./zellij.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    ncdu
    nixpkgs-fmt
    tldr
    pipx
    yamllint
    protobuf
    curlHTTP3
    lazydocker
    fd
    neovim
  ];
}
