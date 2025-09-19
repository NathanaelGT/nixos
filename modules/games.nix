{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (bottles.override { removeWarningPopup = true; })
    lutris
    gamemode
    wineWowPackages.stagingFull
    winetricks
  ];

  programs.steam.enable = true;
}
