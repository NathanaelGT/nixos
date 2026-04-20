{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lmstudio
    unstable.ollama-cuda
    #open-webui
  ];
}

