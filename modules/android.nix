{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
  ];

  virtualisation.waydroid.enable = true;
}
