{ pkgs, ... }:

{
  users.users.nathanaelgt = {
    isNormalUser = true;
    description = "NathanaelGT";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.bash;
  };

  environment.variables = {
    EDITOR = "nvim";
    BROWSER = "zen-beta";
  };
}
