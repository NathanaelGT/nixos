{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vnstat
  ];
 
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];

  systemd.services.NetworkManager-wait-online.enable = false;

  hardware.bluetooth = {
    enable = lib.mkDefault false;
    powerOnBoot = true;
  };

  networking.firewall.allowedTCPPorts = [
    8888 # web animeh
  ];

  #systemd.services.firewall = {
  #  after = [ "graphical.target" ];
  #  wantedBy = [ "graphical.target" ];
  #};
}
