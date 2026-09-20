{ ... }:

{
  imports = [
    ../../modules/home
    ./git.nix
  ];

  home.stateVersion = "25.11";
}
