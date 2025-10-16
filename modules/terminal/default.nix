{ pkgs, ... }:

{
  imports = [
    ./yazi.nix
  ];

  environment.systemPackages = with pkgs; [
    zellij
    tmux
    starship

    nix-search-cli
    speedtest-cli

    dua

    fd # find
    ripgrep # grep
    zoxide # cd
    bat  # cat
    eza  # ls
    dysk # df
  ];

  programs.fish.enable = true;
}

