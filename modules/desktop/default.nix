{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard

    catppuccin-gtk
    catppuccin-cursors.mochaDark

    playerctl
    brightnessctl
    pavucontrol
  ];

  imports = [
    ./hyprland.nix
    #./cosmic.nix
    ./keyboard.nix
    ./mouse.nix
  ];

  #services.printing.enable = true;
}
