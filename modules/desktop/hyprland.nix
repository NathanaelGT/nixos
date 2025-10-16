{ inputs, pkgs, ... }:

{
  imports = [
    #inputs.walker.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    #kdePackages.xwaylandvideobridge

    hypridle
    hyprlock
    hyprpanel
    hyprpolkitagent

    rofi-wayland

    grim
    slurp
    satty
  ];

  programs.hyprland = {
    enable = true;
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      hyprland.default = ["hyprland" "gtk"];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  #programs.walker = {
  #  enable = true;
  #  runAsService = true;
  #};
}
