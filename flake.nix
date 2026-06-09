{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nixpkgs-master.url = "nixpkgs/master";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    #hyprland.url = "github:hyprwm/Hyprland";

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    elephant.url = "github:abenz1267/elephant";

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
  };

  outputs = inputs@{
    nixpkgs,
    nix-cachyos-kernel,
    #hytale-launcher,
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
        {
          nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
        }
        #{
        #  nixpkgs.overlays = [ hytale-launcher.overlays.default ];
        #  nixpkgs.config.allowUnfreePredicate = pkg:
        #    builtins.elem (nixpkgs.lib.getName pkg) [ "hytale-launcher" ];
        #}
      ];
    };
  };
}
