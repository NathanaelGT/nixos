{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop
    litecli
    bluetui
    lazygit
    superfile
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
