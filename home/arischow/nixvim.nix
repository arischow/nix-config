{
  programs.nixvim = {
    enable = true;
    options = {
      number = true;
    };
    plugins = {
      nvim-tree = {
        enable = true;

        autoClose = true;
        disableNetrw = true;
        openOnSetup = true;
      };
      lualine = {
        enable = true;
      };
      toggleterm = {
        enable = true;
      };
    };
    colorschemes.gruvbox.enable = true;
  };
}
