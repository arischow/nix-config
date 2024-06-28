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
    keymaps = import ./keybindings.nix;
    opts = {
      # When "number" and "relativenumber" are set at the same time
      # "number" will provide the capability to show the current line in an absolute number
      # otherwise the current line number will be "0"
      number = true;
      relativenumber = true;

      cursorline = true;
      smartindent = true;
      termguicolors = true;

      # persistent undo
      undofile = true;
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
      comment = {
        enable = true;
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
        settings = {
          current_line_blame = true;
          on_attach = ''
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
      };
      indent-blankline = {
        enable = true;
        settings = {
          indent.highlight = [
            "RainbowYellow"
            "RainbowBlue"
            "RainbowOrange"
            "RainbowGreen"
            "RainbowViolet"
            "RainbowCyan"
          ];
          whitespace.highlight = [
            "Function"
            "Label"
          ];
          whitespace.remove_blankline_trail = false;
          scope.enabled = false;
        };
      };
      rainbow-delimiters = {
        enable = true;
      };
      cmp = {
        enable = true;
        autoEnableSources = false;
        settings =
          {
            snippet = {
              expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            };
            sources = {
              __raw = ''
                cmp.config.sources({
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "treesitter" },
                { name = "path" },
                { name = "buffer" },
                })
              '';
            };
            mapping = {
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<Tab>" = ''
                cmp.mapping(
                  function(fallback)
                    local luasnip = require('luasnip')
                    if cmp.visible() then
                      cmp.select_next_item()
                    elseif luasnip.expandable() then
                      luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                      luasnip.jump(1)
                    else
                      fallback()
                    end
                  end
                , {'i', 's'})
              '';
              "<S-Tab>" = ''
                cmp.mapping(
                  function(fallback)
                    local luasnip = require('luasnip')
                    if cmp.visible() then
                      cmp.select_next_item()
                    elseif luasnip.expandable() then
                      luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                      luasnip.jump(-1)
                    else
                      fallback()
                    end
                  end
                , {'i', 's'})
              '';
            };
          };
      };
      nvim-ufo = {
        enable = false;
      };
      leap = {
        enable = true;
      };
      lspkind = {
        enable = true;
        cmp.enable = true;
        symbolMap = {
          Copilot = "";
        };
      };
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
        extensions.file-browser.enable = true;
        extensions.undo.enable = true;
        settings.defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
          ];
        };
        keymaps = {
          "<leader>fb" = {
            action = "buffers";
            options = {
              desc = "Current Opened Buffers (Telescope)";
            };
          };
          "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "Find Files (Telescope)";
            };
          };
          "<leader>fr" = {
            action = "oldfiles";
            options = {
              desc = "List previously opened files in the current working directory (Telescope)";
            };
          };
          "<leader>fR" = {
            action = "oldfiles";
            options = {
              desc = "List previously opened files (Telescope)";
            };
          };
          "<leader>cd" = {
            action = "lsp_definitions";
            options = {
              desc = "Go to the definition (Telescope)";
            };
          };
          "<leader>cr" = {
            action = "lsp_references";
            options = {
              desc = "Find its references (Telescope)";
            };
          };
        };
      };
      treesitter = {
        enable = true;
      };
      which-key = {
        enable = true;
      };
      lazygit = {
        enable = true;
      };
    };
    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
      disableItalic = true;
      integrations = {
        cmp = true;
        gitsigns = true;
        nvimtree = true;
        telescope = {
          enabled = true;
        };
        treesitter = true;
        which_key = true;
        indent_blankline = {
          enabled = true;
          scope_color = "red";
          colored_indent_levels = true;
        };
        native_lsp.enabled = true;
        leap = true;

      };
    };
  };
}
