{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        # brew
        if test -d /opt/homebrew/bin
          eval "$(/opt/homebrew/bin/brew shellenv)"
        end

        # pyenv
        pyenv init - | source

        # poetry
        poetry completions fish > ~/.config/fish/completions/poetry.fish
        sed -i.bak -E "s/'([a-z]*[[:blank:]][a-z]*)''''/\1'/g" /opt/homebrew/share/fish/vendor_completions.d/poetry.fish
      '';
    };
  };
}
