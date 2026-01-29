{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    litecli
    bluetui
    lazygit
    superfile
    jellyfin-tui
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
