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
  ];
}

