{ pkgs, lib, ... }:

{
  imports = [
    ./php.nix
    ./llm.nix
  ];

  environment.systemPackages = with pkgs; [
    gcc

    git-credential-manager
    jujutsu
    jjui
    #unstable.bun
    nodejs_24
    difftastic

    rustc
    cargo
    clippy

    #python314
    #poetry
    uv

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

    mailhog
    mailpit
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      nss
      openssl
      curl
      expat
    ];
  };

  programs.git = {
    enable = true;
    config = {
      credential.helper = "manager";
      user.name = "NathanaelGT";
      user.email = "gordontanu2004@gmail.com";
    };
  };

  virtualisation.docker = {
    enable = false;
    storageDriver = "btrfs";
  };

  hardware.nvidia-container-toolkit.enable = lib.mkDefault false;

  users.users.nathanaelgt.extraGroups = [ "docker" "i2c" ];
}

