{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "/Users/arischow/Downloads/hey.png";
      };
      modules = [
        "title"
        "separator"
        "os"
        "battery"
        "terminalfont"
        "packages"
      ];
    };
  };
}
