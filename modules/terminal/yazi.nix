{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    resvg
    imagemagick
  ];
}
