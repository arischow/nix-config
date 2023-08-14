{
  programs.nixvim = {
    enable = true;
    options = {
      number = true;
    };
    maps = {
      normalVisualOp.";" = ":"; # Same as noremap ; :     
      normal."<C-[>" = {
        silent = true;
        action = ":bprevious<CR>";
      };
      normal."<C-]>" = {
        silent = true;
        action = ":bnext<CR>";
      };
    };
    plugins = {
      bufferline = {
        enable = true;
      };
      nvim-tree = {
        enable = true;

        autoClose = true;
        disableNetrw = true;
      };
      lualine = {
        enable = true;
	sections.lualine_c = [{
	  name = "filename";
	  extraConfig = {
	    path = 1;
	  };
	}];
      };
      telescope = {
        enable = true;
        keymaps = {
            "<C-o>" = {
              action = "git_files";
              desc = "Telescope Git Files";
            };
          };
      };
      toggleterm = {
        enable = true;
      };
    };
    colorschemes.gruvbox.enable = true;
  };
}
