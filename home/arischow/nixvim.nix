{
  programs.nixvim = {
    enable = true;
    options = {
      number = true;
      cursorline = true;
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
      cmp-buffer = {
        enable = true;
      };
      cmp-cmdline = {
        enable = true;
      };
      cmp-nvim-lsp = {
        enable = true;
      };
      cmp-path = {
        enable = true;
      };
      indent-blankline = {
        enable = true;
      };
      nvim-cmp = {
        enable = true;
	sources = [
	  { name = "nvim_lsp"; }
	  { name = "path"; }
	  { name = "buffer"; }
	  { name = "cmdline"; }
	];
        mappingPresets = [ "insert" ];
        mapping =
        {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
	  "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), { \"i\", \"s\" })";
        };
      };
      nvim-tree = {
        enable = true;

        autoClose = true;
        disableNetrw = true;
      };
      lsp = {
        enable = true;
	servers = {
	  pylsp.enable = true;
	};
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
              action = "find_files";
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
