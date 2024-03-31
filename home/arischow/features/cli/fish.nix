{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        fish_add_path ~/.local/bin

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
