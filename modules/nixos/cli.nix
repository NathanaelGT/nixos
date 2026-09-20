{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    flatpak

    unzip
    unrar

    iw
    linux-wifi-hotspot

    poppler-utils
    img2pdf

    typst
    pandoc
    typ2docx
  ];
}
