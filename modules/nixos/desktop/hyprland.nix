{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unstable.hyprland

    #kdePackages.xwaylandvideobridge
    xdg-desktop-portal-gtk

    unstable.hypridle # bugfix
    hyprlock
    hyprpicker
    unstable.hyprshutdown
    hyprpolkitagent

    (rofi.override {
      plugins = [
        rofi-calc
      ];
    })

    waybar
    networkmanagerapplet
    overskride

    dunst

    inputs.hyprcap.packages."${stdenv.hostPlatform.system}".default

    grim
    slurp
    satty

    udiskie
  ];

  programs.hyprland = {
    enable = true;
  };

  programs.walker = {
    enable = true;
  };

  disabledModules = [ "services/misc/elephant.nix" ];

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

  security = {
    rtkit.enable = true;

    polkit.enable = true;
  };

  systemd.user.services.xdg-desktop-portal-gtk.wantedBy = [ "xdg-desktop-portal.service" ];

  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };

    udisks2.enable = true;
  };
}
