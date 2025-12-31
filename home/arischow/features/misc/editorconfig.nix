{
  editorconfig = {
    enable = true;
    settings = {
      "sshconfig" = {
        indent_size = 2;
      };
      # *.proto: https://protobuf.dev/programming-guides/style/
      "*.{json,nix,proto,yaml,yml}" = {
        indent_size = 2;
      };
      # JavaScript
      "*.{js,jsx,ts,tsx}" = {
        indent_size = 2;
      };
      # HTML and CSS
      "*.{html,css,scss}" = {
        indent_size = 2;
      };
      "Makefile" = {
        indent_style = "tab";
      };
    };
  };
}
