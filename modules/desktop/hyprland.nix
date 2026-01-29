{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #kdePackages.xwaylandvideobridge
    xdg-desktop-portal-gtk

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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";

    GDK_BACKEND = "wayland,*";
    GTK_CSD = "0";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORM = "wayland";

    SDL_VIDEODRIVER = "wayland";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  #xdg.portal = {
  #  enable = true;
  #  xdgOpenUsePortal = true;
  #  extraPortals = with pkgs; [
  #    xdg-desktop-portal-hyprland
  #    xdg-desktop-portal-gtk
  #  ];
  #  config = {
  #    common = {
  #      default = [ "hyprland" "gtk" ];
  #    };
  #    Hyprland = {
  #      default = [ "hyprland" "gtk" ];
  #      "org.freedesktop.portal.Settings" = [ "gtk" ];
  #      "org.freedesktop.portal.FileChooser" = [ "gtk" ];
  #    };
  #  };
  #};
  xdg.portal = {
    enable = true;

    config = {
      hyprland-portals = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "kde";
        # except for the secret portal, which is handled by gnome-keyring
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  security.rtkit.enable = true;

  systemd.user.services.xdg-desktop-portal-gtk.wantedBy = [ "xdg-desktop-portal.service" ];

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
