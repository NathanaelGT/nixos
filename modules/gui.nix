{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    youtube-music
    obsidian
    vlc
    jetbrains.phpstorm
    vscode
    kdePackages.kolourpaint
    libreoffice-qt6-fresh
    feh
    inputs.zen-browser.packages."${system}".twilight
    brave
    #zoom-us
    gparted
    upscayl
    #localsend
    #davinci-resolve
  ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.extensions; [
      adblockify
      hidePodcasts
      shuffle
      copyToClipboard
      fullAppDisplay
    ];
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.themes.catppuccin;
    colorScheme = "mocha";
  };

  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
    ];
  };
}
