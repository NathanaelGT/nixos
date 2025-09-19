{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bluetui
    lazygit
    superfile
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
