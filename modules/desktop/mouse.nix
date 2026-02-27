{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libratbag
    piper # logitech
  ];

  services.ratbagd.enable = true;
}
