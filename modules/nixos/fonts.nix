{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;

      antialias = true;
      hinting = {
        enable = true;
        autohint = true;
      };

      defaultFonts = {
        monospace = [ "FiraCode Nerd Font Mono" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    packages = with pkgs; [
      font-awesome

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      nerd-fonts.fira-code

      corefonts # Andalé Mono, Arial, Arial Black, Comic Sans MS, Courier New, Georgia, Impact, Times New Roman, Trebuchet MS,Verdana, Webdings
      vista-fonts # Calibri, Cambria, Candara, Consolas, Constantia, Corbel 
    ];
  };
}

