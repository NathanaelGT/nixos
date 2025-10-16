{
  inputs = {
    hyprland.url = "github:hyprwm/Hyprland";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixos-cli = {
      url = "github:nix-community/nixos-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #elephant.url = "github:abenz1267/elephant";
    
    #walker = {
    #  url = "github:abenz1267/walker";
    #  inputs.elephant.follows = "elephant";
    #};
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations.Victus = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
