{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./graphics.nix
    ./network.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/tools.nix
    ../../modules/nixos/graphical.nix
    ../../modules/nixos/games.nix

    inputs.spicetify-nix.nixosModules.default
    inputs.nixos-cli.nixosModules.nixos-cli
    inputs.walker.nixosModules.default
  ];

  home-manager.users.nathanaelgt = {
    imports = [
      ../../modules/home-manager/git.nix
      ../../modules/home-manager/rofi.nix
    ];

    home.stateVersion = "25.11";
  };

  services.getty.autologinUser = "nathanaelgt";

  system.stateVersion = "25.05";
}
