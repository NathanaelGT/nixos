{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #kdePackages.xwaylandvideobridge
    #xdg-desktop-portal-gtk

    hypridle
    hyprlock
    hyprpanel
    hyprpolkitagent

    rofi

    waybar
    dunst

    grim
    slurp
    satty
  ];

  programs.hyprland = {
    enable = true;
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    #portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  #environment.sessionVariables = {
    #NIXOS_OZONE_WL = "1";
    #MOZ_ENABLE_WAYLAND = "1";

    #GDK_BACKEND = "wayland,*";
    #GTK_CSD = "0";
    #QT_QPA_PLATFORM = "wayland";

    #SDL_VIDEODRIVER = "wayland";
  #};

  xdg.portal = {
    enable = true;
    #wlr.enable = true;
    xdgOpenUsePortal = true;
    #extraPortals = [
    #  pkgs.xdg-desktop-portal-gtk
    #  pkgs.xdg-desktop-portal-wlr
    #];
    #configPackages = [
    #  pkgs.xdg-desktop-portal-gtk
    #  pkgs.xdg-desktop-portal-wlr
    #];
    #config = {
    #  hyprland.default = ["gtk"];
    #};
    #extraPortals = with pkgs; [
    #  xdg-desktop-portal-hyprland
    #  xdg-desktop-portal-gtk
    #];
  };

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}
