{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./graphics.nix
    ../../modules/nixos
    inputs.spicetify-nix.nixosModules.default
    inputs.nixos-cli.nixosModules.nixos-cli
    inputs.walker.nixosModules.default
  ];

  home-manager.users.nathanaelgt = {
    imports = [ ../../home/nathanaelgt ];
  };

  services.getty.autologinUser = "nathanaelgt";

  system.stateVersion = "25.05";
}
