{ pkgs, ... }:
{
  programs.starship =
    let
      flavour = "macchiato";
    in
    {
      enable = true;
      settings = {
        format = "$all";
        palette = "catppuccin_${flavour}";
      } // (builtins.fromTOML (builtins.readFile ./starship.toml))
      // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d23"; # Replace with the latest commit hash
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          } + /palettes/${flavour}.toml));
    };
}
