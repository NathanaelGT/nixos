{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    plugins = [ pkgs.rofi-calc ];
    theme = "${pkgs.rofi}/share/rofi/themes/material.rasi";
    font = "Mono 12";
    modes = [ "drun" "calc" ];
  };
}
