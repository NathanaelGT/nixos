{
  networking.firewall = {
    allowedTCPPorts = [
      8887 # web animeh dev backend
      8888 # web animeh
    ];

    allowedUDPPorts = [
      38899 # wizlight
    ];
  };
}
