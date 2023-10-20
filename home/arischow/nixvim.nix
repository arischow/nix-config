{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    clipboard.register = "unnamedplus";
    extraPlugins = with pkgs.vimPlugins; [
      vim-be-good
      friendly-snippets
      nvim-web-devicons
      telescope-live-grep-args-nvim
      refactoring-nvim
    ];
    options = {
      # When "number" and "relativenumber" are set at the same time
      # "number" will provide the capability to show the current line in an absolute number
      # otherwise the current line number will be "0"
      number = true;
      relativenumber = true;

      cursorline = true;
      smartindent = true;
      termguicolors = true;
    };
    extraConfigLua = ''
      -- "refactoring" plugin
      require('refactoring').setup({})
    '';
    autoCmd = [
      # https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
      # To solve the problem when upon restoring the session when NvimTree is opened.
      # Will have a NvimTree buffer tab if disables this.
      {
        event = [ "BufEnter" ];
        pattern = "NvimTree*";
        callback = {
          __raw = ''
            function()
              local api = require('nvim-tree.api')
              local view = require('nvim-tree.view')

              if not view.is_visible() then
                api.tree.open()
              end
            end
          '';
        };
      }
    ];
    maps = {
      # normalVisualOp.";" = ":"; # Same as noremap ; :     
      normal."<leader>fg" = ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>";
      normal."<C-d>" = {
        silent = true;
        action = "<cmd>bdelete<CR>";
      };
      normal."<C-h>" = {
        silent = true;
        action = "<cmd>bprevious<CR>";
      };
      normal."<C-l>" = {
        silent = true;
        action = "<cmd>bnext<CR>";
      };
      normal."<C-f>" = {
        silent = true;
        action = "<C-f>zz<CR>";
      };
      normal."<C-b>" = {
        silent = true;
        action = "<C-b>zz<CR>";
      };
    };
    plugins = {
      auto-save = {
        enable = true;
        executionMessage.message = "";
      };
      auto-session = {
        enable = true;
      };
      bufferline = {
        enable = true;
        offsets = [
          {
            filetype = "NvimTree";
            text = "Explorer";
          }
        ];
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
      cmp_luasnip = {
        enable = true;
      };
      cmp-path = {
        enable = true;
      };
      cmp-treesitter = {
        enable = true;
      };
      comment-nvim = {
        enable = true;
        mappings = {
          basic = true;
          extended = true;
        };
      };
      copilot-cmp = {
        enable = true;
      };
      copilot-lua = {
        enable = true;
        panel.enabled = false;
        suggestion.enabled = false;
      };
      # fugitive = {
      #   enable = true;
      # };
      gitsigns = {
        enable = true;
        currentLineBlame = true;
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
        charHighlightList = [
          "IndentBlanklineIndent1"
          "IndentBlanklineIndent2"
          "IndentBlanklineIndent3"
          "IndentBlanklineIndent4"
          "IndentBlanklineIndent5"
          "IndentBlanklineIndent6"
        ];
      };
      nvim-cmp = {
        enable = true;
        snippet.expand = "luasnip";
        sources = [
          { name = "copilot"; }
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "treesitter"; }
          { name = "path"; }
          { name = "buffer"; }
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
      nvim-ufo = {
        enable = false;
      };
      lspkind = {
        enable = true;
        cmp.enable = true;
        symbolMap = {
          Copilot = "";
        };
      };
      # nvim-tree = {
      #   enable = true;
      #   disableNetrw = true;
      #   onAttach = {
      #     __raw = ''
      #       function(bufnr)
      #         local api = require "nvim-tree.api"
      #
      #         local function opts(desc)
      #           return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      #         end
      #
      #         -- default mappings
      #         api.config.mappings.default_on_attach(bufnr)
      #
      #         -- custom mappings
      #         vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
      #         vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      #       end
      #     '';
      #   };
      #   view = {
      #     side = "right";
      #     number = true;
      #     relativenumber = true;
      #   };
      # };
      lsp = {
        enable = true;
        onAttach = ''
          if client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        '';
        capabilities = ''
          capabilities.textDocument.completion.completionItem.snippetSupport = true
        '';
        servers = {
          pyright.enable = true;
          lua-ls.enable = true;
          nil_ls.enable = true;
          nil_ls.settings.formatting.command = [ "nixpkgs-fmt" ];
          jsonls.enable = true;
          tsserver.enable = true;
          yamlls.enable = true;
        };
      };
      lualine = {
        enable = true;
        disabledFiletypes.statusline = [ "NvimTree" ];
        sections.lualine_c = [{
          name = "filename";
          extraConfig = {
            path = 1;
          };
        }];
      };
      luasnip = {
        enable = true;
        fromVscode = [
          { include = [ "python" "javascript" ]; }
        ];
      };
      telescope = {
        enable = true;
        extensions.file_browser.enable = true;
        keymaps = {
          "<leader>fb" = {
            action = "buffers";
            desc = "Current Opened Buffers (Telescope)";
          };
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
        };
      };
      treesitter = {
        enable = true;
      };
      which-key = {
        enable = true;
      };
    };
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
