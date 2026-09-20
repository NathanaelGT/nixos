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
      ../../home/nathanaelgt
      ../../modules/home-manager/rofi.nix
    ];
  };

  services.getty.autologinUser = "nathanaelgt";

  system.stateVersion = "25.05";
}
