{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nerdtree
    ];

    withPython3 = true;
    extraPython3Packages = pyPkgs: with pyPkgs; [
      python-lsp-server
      python-lsp-black
      pyls-isort
    ];
  };
}
