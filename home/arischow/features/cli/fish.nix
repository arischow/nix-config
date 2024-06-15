{pkgs, ...}:
{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        fish_add_path ~/.local/bin
        fish_add_path ~/.cargo/bin

        # brew
        if test -d /opt/homebrew/bin
          eval "$(/opt/homebrew/bin/brew shellenv)"
        end

        # pyenv
        pyenv init - | source

      '';
      plugins = [
        {
          name = "nvm";
          src = pkgs.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "nvm.fish";
            rev = "master";
            sha256 = "LV5NiHfg4JOrcjW7hAasUSukT43UBNXGPi1oZWPbnCA=";
          };
        }
      ];
    };
  };
}
