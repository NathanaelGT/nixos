{ pkgs, ... }:

{
  imports = [
    ./php.nix
  ];

  environment.systemPackages = with pkgs; [
    git-credential-manager
    jujutsu
    bun
    nodejs_24

    mise
    re2c
    libxml2
    libxml2.dev
    mlocate

    podman
    podman-tui
    podman-compose
    pods

    devenv

    #mailhog
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

