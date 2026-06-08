{ config, inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules
    inputs.spicetify-nix.nixosModules.default
    inputs.nixos-cli.nixosModules.nixos-cli
    inputs.walker.nixosModules.default
  ];

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      master = import inputs.nixpkgs-master {
        system = pkgs.stdenv.system;
        config = { allowUnfree = true; };
      };

      unstable = import inputs.nixpkgs-unstable {
        system = pkgs.stdenv.system;
        config = { allowUnfree = true; };
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://attic.xuyh0120.win/lantian"
      "https://hyprland.cachix.org"
      "https://yazi.cachix.org"
      "https://cache.nixos-cuda.org"
      "https://walker.cachix.org"
      "https://walker-git.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
    ];
    trusted-users = [ "root" "nathanaelgt" ];

    http-connections = 128;
    max-substitution-jobs = 128;
    max-jobs = "auto";
  };

  networking.hostName = "Victus";

  users.users.nathanaelgt = {
    isNormalUser = true;
    description = "NathanaelGT";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.bash;
  };

  services.getty.autologinUser = "nathanaelgt";

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "zen-beta";
  };

  system.stateVersion = "25.05";
}
