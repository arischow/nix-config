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
      '';
    };
  };
}
