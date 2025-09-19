{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git-credential-manager
    jujutsu
    bun
    mise
    frankenphp
    laravel
    php
    php84Extensions.opcache
    php84Extensions.iconv
    php84Packages.composer
    devenv
  ];

  programs.git = {
    enable = true;
    config = {
      credential.helper = "manager";
      user.name = "NathanaelGT";
      user.email = "gordontanu2004@gmail.com";
    };
  };
}
