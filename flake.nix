{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nixpkgs-master.url = "nixpkgs/master";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #catppuccin.url = "github:catppuccin/nix/release-26.05";

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
    ...
  }:
  let
    lib = nixpkgs.lib;
  in
  {
    # Adding a host is a directory in ./hosts plus one line here.
    nixosConfigurations = lib.mapAttrs (
      hostname: hostPath:
      lib.nixosSystem {
        specialArgs = { inherit inputs hostname; };

        modules = [
          {
            nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
            networking.hostName = lib.mkDefault hostname;
            # Shared by every host; a machine whose state really began on a
            # different release overrides this with its own value.
            system.stateVersion = lib.mkDefault "25.05";
          }
          hostPath
          #inputs.catppuccin.nixosModules.catppuccin
          #{
          #  nixpkgs.overlays = [ inputs.hytale-launcher.overlays.default ];
          #  nixpkgs.config.allowUnfreePredicate = pkg:
          #    builtins.elem (lib.getName pkg) [ "hytale-launcher" ];
          #}
        ];
      }
    ) {
      Victus = ./hosts/Victus;
    };
  };
}
