{
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
        indent_style = "space";
        indent_size = 4;
      };
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
