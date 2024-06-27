{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      shellInit = ''
        fish_add_path ~/.local/bin
        fish_add_path ~/.cargo/bin

        # brew
        if test -d /opt/homebrew/bin
          eval "$(/opt/homebrew/bin/brew shellenv)"
        end

        # pyenv
        pyenv init - | source

        # fzf.fish
        # make sure fzf.fish can take the control of searching history
        fzf_configure_bindings --history=\cr
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
        {
          name = "fzf";
          src = pkgs.fetchFromGitHub {
            owner = "PatrickF1";
            repo = "fzf.fish";
            rev = "main";
            sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
          };
        }
      ];
    };
  };
}
