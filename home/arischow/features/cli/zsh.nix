{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
    };
    zsh.initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"

      export PYENV_ROOT="$HOME/.pyenv"
      command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"

      autoload -U compinit && compinit -u
    '';
    zsh.history.extended = true;

    zsh.oh-my-zsh.enable = true;
    zsh.oh-my-zsh.plugins = [
      "docker"
      "docker-compose"
      "poetry"
    ];

    zsh.oh-my-zsh.extraConfig = ''
      zstyle :omz:plugins:ssh-agent agent-forwarding yes
      zstyle :omz:plugins:ssh-agent identities id_ed25519 id_rsa_mintel tencent_cloud
      zstyle ':completion:*:*:docker:*' option-stacking yes
      zstyle ':completion:*:*:docker-*:*' option-stacking yes
    '';
  };
}
