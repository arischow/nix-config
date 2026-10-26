{ pkgs, ... }: {
  imports = [
    ./autojump.nix
    ./aws.nix
    ./bat.nix
    ./btop.nix
    ./direnv.nix
    ./eza.nix
    ./fastfetch.nix
    ./fish.nix
    ./fzf.nix
    ./git.nix
    ./github.nix
    ./infra.nix
    ./jq.nix
    ./k9s.nix
    ./lazygit.nix
    ./pay-respects.nix
    ./ripgrep.nix
    ./starship.nix
    ./tmux.nix
    ./zellij.nix
  ];

  home.packages = with pkgs; [
    ncdu
    nixpkgs-fmt
    tldr
    pre-commit
    yamllint
    protobuf
    lazydocker
    fd
    neovim
    amazon-ecr-credential-helper
    cloc
    glab
    buf
  ];
}
