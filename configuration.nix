{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    inputs.spicetify-nix.nixosModules.default
    inputs.nixos-cli.nixosModules.nixos-cli
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyrpland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    trusted-users = [ "root" "nathanaelgt" ];
  };

  networking.hostName = "Victus";

  users.users.nathanaelgt = {
    isNormalUser = true;
    description = "NathanaelGT";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  services.getty.autologinUser = "nathanaelgt";

  environment.variables = {
    EDITOR = "nvim";
  }

  environment.systemPackages = with pkgs; [
    ntfs3g
    psmisc
    re2c
    pkg-config
    libxml2
    libxml2.dev
    bison
    wl-clipboard
    nvd
    nix-output-monitor
    autoconf
    mlocate
    lshw
  ];

  system.stateVersion = "25.05";
}
