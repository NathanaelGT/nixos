{ inputs, pkgs, ... }:

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
    substituters = [
      "https://hyprland.cachix.org"
      "https://yazi.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
    ];
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
  };

  system.stateVersion = "25.05";
}
