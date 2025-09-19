{ pkgs, ... }:

{
  imports = [
    ./yazi.nix
  ];

  environment.systemPackages = with pkgs; [
    fastfetch
    btop
    nethogs
    wget

    zellij
    tmux
    starship

    nix-search-cli
    speedtest-cli

    gcc

    litecli

    bat
    dua
    eza
  ];

  programs.fish.enable = true;

  programs.pay-respects.enable = true;
  programs.nix-index.enable = true;
}
