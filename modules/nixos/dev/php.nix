{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    php
    php84Extensions.opcache
    php84Extensions.iconv
    php84Packages.composer
    frankenphp
    laravel
  ];
}

