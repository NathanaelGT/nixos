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
    unstable.antigravity
    vscode
    unstable.opencode
    bruno
    kdePackages.kolourpaint
    libreoffice-qt6-fresh
    onlyoffice-desktopeditors
    feh
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".beta
    inputs.helium.packages.${stdenv.hostPlatform.system}.default
    brave
    vivaldi
    kdePackages.dolphin
    #zoom-us
    gparted
    localsend
    #davinci-resolve
    kdePackages.kdenlive
    #winboat
    gopeed
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

  programs.kdeconnect.enable = true;
}
