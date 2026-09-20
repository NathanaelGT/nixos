{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fuse
    fuse2
    fuse3
  ];

  boot.kernelModules = [ "fuse" ];
  
  programs.fuse.userAllowOther = true;
}

