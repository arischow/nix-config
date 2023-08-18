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
      auto-session = {
        enable = true;
      };
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
      cmp-treesitter = {
        enable = true;
      };
      gitsigns = {
        enable = true;
        onAttach.function = ''
           function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
              if vim.wo.diff then return ']c' end
              vim.schedule(function() gs.next_hunk() end)
              return '<Ignore>'
            end, {expr=true})

            map('n', '[c', function()
              if vim.wo.diff then return '[c' end
              vim.schedule(function() gs.prev_hunk() end)
              return '<Ignore>'
            end, {expr=true})

            -- Actions
            map('n', '<leader>hs', gs.stage_hunk, { desc = "stage hunk" })
            map('n', '<leader>hr', gs.reset_hunk, { desc = "reset hunk" })
            map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "stage hunk" })
            map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "reset hunk" })
            map('n', '<leader>hS', gs.stage_buffer, { desc = "stage buffer" })
            map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "undo stage hunk" })
            map('n', '<leader>hR', gs.reset_buffer, { desc = "reset buffer" })
            map('n', '<leader>hp', gs.preview_hunk, { desc = "preview hunk" })
            map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "blame line (full)" })
            map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "toggle current line blame" })
            map('n', '<leader>hd', gs.diffthis, { desc = "diffthis" })
            map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "diffthis" })
            map('n', '<leader>td', gs.toggle_deleted, { desc = "toggle deleted" })

            -- Text object
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          end
        '';
      };
      indent-blankline = {
        enable = true;
        useTreesitter = true;
      };
      nvim-cmp = {
        enable = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "treesitter"; }
          #{ name = "path"; }
          #{ name = "buffer"; }
          #{ name = "cmdline"; }
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
      lspkind = {
        enable = true;
        cmp.enable = true;
      };
      nvim-tree = {
        enable = true;

        autoClose = true;
        disableNetrw = true;
      };
      lsp = {
        enable = true;
        servers = {
          pylsp = {
            enable = true;
            settings.plugins = {
              flake8.enabled = true;
              yapf.enabled = true;
            };
          };
          nil_ls.enable = true;
          nil_ls.settings.formatting.command = [ "nixpkgs-fmt" ];
          jsonls.enable = true;
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
          "<leader>ff" = {
            action = "find_files";
            desc = "Find Files (Telescope)";
          };
          "<leader>fr" = {
            action = "oldfiles";
            desc = "List previously opened files in the current working directory (Telescope)";
          };
          "<leader>fR" = {
            action = "oldfiles";
            desc = "List previously opened files (Telescope)";
          };
          "<leader>cd" = {
            action = "lsp_definitions";
            desc = "Go to the definition (Telescope)";
          };
          "<leader>cr" = {
            action = "lsp_references";
            desc = "Find its references (Telescope)";
          };
          "<leader>fg" = {
            action = "live_grep";
            desc = "Search everywhere (Telescope)";
          };
        };
      };
      treesitter = {
        enable = true;
      };
      toggleterm = {
        enable = true;
      };
      which-key = {
        enable = true;
      };
    };
    #   colorschemes.gruvbox.enable = true;
    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
      integrations = {
        cmp = true;
        gitsigns = true;
        nvimtree = true;
        telescope = true;
        treesitter = true;
        which_key = true;
        indent_blankline = {
          enabled = true;
          colored_indent_levels = true;
        };
        native_lsp.enabled = true;
      };
    };
  };
}
