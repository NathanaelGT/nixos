{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    autoconf
    bison
    pkg-config
  ];
}

