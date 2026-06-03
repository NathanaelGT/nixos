{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
  ];

  virtualisation.waydroid.enable = true;

  systemd.services.waydroid-container = {
    wantedBy = lib.mkForce [ ];
  };
}
