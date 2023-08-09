{
  programs.nixvim = {
    enable = true;
    options = {
      number = true;
    };
    plugins.nvim-tree.enable = true;
    plugins.nvim-tree.openOnSetup = true;
    colorschemes.gruvbox.enable = true;
  };
}