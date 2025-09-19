{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hypridle
    hyprlock
    hyprpanel
    hyprpolkitagent

    catppuccin-gtk
    catppuccin-cursors.mochaDark

    rofi-wayland

    playerctl
    brightnessctl
    pavucontrol

    grim
    slurp
    satty
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };
}
