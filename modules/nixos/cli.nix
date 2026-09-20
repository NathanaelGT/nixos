{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    flatpak

    unzip
    unrar

    iw

    poppler-utils
    img2pdf

    typst
    pandoc
    typ2docx
  ];
}
