{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    psmisc
    lshw
    nethogs
    wget
    fastfetch
    nvd
    nix-output-monitor
    inotify-tools
    python314Packages.pywizlight
    ddcutil
    appimage-run
  ];

  hardware.i2c.enable = true;
}

