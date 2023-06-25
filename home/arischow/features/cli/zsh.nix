{
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };
    zsh.oh-my-zsh.enable = true;
    zsh.initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    zsh.history.extended = true;
  };
}
