{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yazi
    ffmpeg
    p7zip
    jq
    poppler
    fzf
    resvg
    imagemagick
  ];
}
