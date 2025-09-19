{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libratbag
    piper
  ];

  services.ratbagd.enable = true;
}
