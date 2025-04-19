{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
  ];
  fonts.fontconfig.enable = true;
}
