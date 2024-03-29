{
  programs = {
    fish = {
      enable = true;
      loginShellInit = ''
      # brew
      if test -d /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
      end
      '';
    };
  };
}
