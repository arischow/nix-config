{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
    };
    zsh.initExtra = ''
      # This speeds up pasting w/ autosuggest
      # https://github.com/zsh-users/zsh-autosuggestions/issues/238
      pasteinit() {
        OLD_SELF_INSERT=''${''${(s.:.)widgets[self-insert]}[2,3]}
        zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
      }

      pastefinish() {
        zle -N self-insert $OLD_SELF_INSERT
      }

      # brew
      if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi

      export PYENV_ROOT="$HOME/.pyenv"
      command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"

      # thefuck
      if type fuck &> /dev/null; then
        eval $(thefuck --alias)
      fi

      export PATH="/Users/arischow/.local/bin:$PATH"

      autoload -U compinit && compinit -u
    '';
    zsh.history.extended = true;

    zsh.oh-my-zsh.enable = true;
    zsh.oh-my-zsh.plugins = [
      "docker"
      "docker-compose"
      "poetry"
      "ssh-agent"
    ];

    zsh.oh-my-zsh.extraConfig = ''
      zstyle :omz:plugins:ssh-agent agent-forwarding yes
      zstyle :omz:plugins:ssh-agent identities id_ed25519 id_rsa_mintel tencent_cloud
      zstyle ':completion:*:*:docker:*' option-stacking yes
      zstyle ':completion:*:*:docker-*:*' option-stacking yes
      zstyle :bracketed-paste-magic paste-init pasteinit
      zstyle :bracketed-paste-magic paste-finish pastefinish
    '';
  };
}
