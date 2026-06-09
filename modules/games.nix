{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (bottles.override { removeWarningPopup = true; })
    #lutris
    gamemode
    wineWow64Packages.stagingFull
    winetricks
    unstable.protontricks

    mangohud
    lsfg-vk
    lsfg-vk-ui

    openxr-loader

    zulu
    zulu17
    zulu8
    modrinth-app
  ];

  programs.steam.enable = true;
}
