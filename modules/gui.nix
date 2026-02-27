{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    youtube-music
    obsidian
    vlc
    jetbrains.phpstorm
    jetbrains.idea
    zed-editor
    master.antigravity
    vscode
    bruno
    kdePackages.kolourpaint
    libreoffice-qt6-fresh
    onlyoffice-desktopeditors
    feh
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".beta
    brave
    vivaldi
    #zoom-us
    gparted
    #upscayl
    #localsend
    #davinci-resolve
    #winboat
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
