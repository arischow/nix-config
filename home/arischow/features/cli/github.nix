{ pkgs, ... }: {
  # Copilot: https://docs.github.com/en/copilot/github-copilot-in-the-cli/setting-up-github-copilot-in-the-cli
  home.packages = with pkgs; [
    gh
  ];
}