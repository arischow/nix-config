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

        # Show full path instead of using only the first letter
        set fish_prompt_pwd_dir_length 0

        # Show the last three dir names in full so Timing.app can track what I've been working on.
        function fish_title
            set -q argv[1]; or set argv fish
            echo (fish_prompt_pwd_dir_length=1 fish_prompt_pwd_full_dirs=3 prompt_pwd): $argv;
        end

        # uv
        uv generate-shell-completion fish | source
        uvx --generate-shell-completion fish | source
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
