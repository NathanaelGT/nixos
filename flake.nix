{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nixpkgs-master.url = "nixpkgs/master";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
 
    #hyprland.url = "github:hyprwm/Hyprland";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixos-cli = {
      url = "github:nix-community/nixos-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hytale-launcher = {
    #  url = "github:visoredkon/hytale-launcher-flake";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    hyprcap.url = "github:NathanaelGT/hyprcap";
  };

  outputs = inputs@{
    nixpkgs,
    chaotic,
    #hytale-launcher,
    hyprcap,
    ...
  }:
  let
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations.Victus = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        chaotic.nixosModules.default
        #{
        #  nixpkgs.overlays = [ hytale-launcher.overlays.default ];
        #  nixpkgs.config.allowUnfreePredicate = pkg:
        #    builtins.elem (nixpkgs.lib.getName pkg) [ "hytale-launcher" ];
        #}
      ];
    };
  };
}
