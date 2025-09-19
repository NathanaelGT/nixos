{
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];

  hardware.bluetooth.enable = true;

  networking.firewall.allowedTCPPorts = [
    8888 # web animeh
  ];
}
