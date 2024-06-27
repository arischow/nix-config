[
  {
    key = "<leader>fg";
    lua = true;
    action = "require('telescope').extensions.live_grep_args.live_grep_args";
  }
  {
    key = "<C-d>";
    action = "<cmd>bdelete<CR>";
    options = {
      silent = true;
    };
  }
  {
    key = "<C-h>";
    action = "<cmd>bprevious<CR>";
    options = {
      silent = true;
    };
  }
  {
    key = "<C-l>";
    action = "<cmd>bnext<CR>";
    options = {
      silent = true;
    };
  }
  {
    key = "<C-f>";
    action = "<C-f>zz<CR>";
    options = {
      silent = true;
    };
  }
  {
    key = "<C-b>";
    action = "<C-b>zz<CR>";
    options = {
      silent = true;
    };
  }
  {
    key = "∆"; # <A-j>
    action = ":m .+1<CR>==";
    options = {
      silent = true;
      desc = "move the current line down";
    };
  }
  {
    key = "˚"; # <A-k>
    action = ":m .-2<CR>==";
    options = {
      silent = true;
      desc = "move the current line up";
    };
  }
  {
    key = "<leader>g";
    action = ":LazyGit<CR>";
    options = {
      silent = true;
      desc = "LazyGit";
    };
  }
]
