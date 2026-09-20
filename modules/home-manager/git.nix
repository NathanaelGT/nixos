{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      credential.helper = "manager";
      user.name = "NathanaelGT";
      user.email = "gordontanu2004@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  home.packages = [ pkgs.git-credential-manager ];
}
