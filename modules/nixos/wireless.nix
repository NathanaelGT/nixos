{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    linux-wifi-hotspot
    iwmenu
  ];

  hardware.bluetooth = {
    enable = lib.mkDefault true;
    powerOnBoot = true;
  };
}
