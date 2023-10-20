{
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        indent_style = "space";
        indent_size = 4;
      };
      # *.proto: https://protobuf.dev/programming-guides/style/
      "*.{json,nix,proto,yaml,yml}" = {
        indent_size = 2;
      };
      # JavaScript
      "*.{js,jsx,ts,tsx}" = {
        indent_size = 2;
      };
      "Makefile" = {
        indent_style = "tab";
      };
    };
  };
}
