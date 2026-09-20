{ inputs, lib }:

{ hostname, modules ? [ ] }:

lib.nixosSystem {
  specialArgs = { inherit inputs hostname; };

  modules = [
    {
      nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
      networking.hostName = lib.mkDefault hostname;
    }
    #inputs.catppuccin.nixosModules.catppuccin
    #{
    #  nixpkgs.overlays = [ inputs.hytale-launcher.overlays.default ];
    #  nixpkgs.config.allowUnfreePredicate = pkg:
    #    builtins.elem (lib.getName pkg) [ "hytale-launcher" ];
    #}
  ] ++ modules;
}
