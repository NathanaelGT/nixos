{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lmstudio
    #ollama-cuda
    #open-webui
  ];
}

