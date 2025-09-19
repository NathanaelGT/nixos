{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.tmp.useTmpfs = true;

  boot.loader.timeout = 1;
  boot.loader.systemd-boot.editor = false;

  boot.kernelParams = [
    "quiet"                      # suppress most kernel logs
    "loglevel=3"                 # only show errors
    "udev.log_level=3"           # silence udev logs
    "vt.global_cursor_default=0" # hide the blinking cursor
  ];

  boot.consoleLogLevel = 3;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = [ "on-the-go" ];

      # Completely disable NVIDIA
      services.xserver.videoDrivers = [ "modesetting" ];
      hardware.nvidia = {
        modesetting.enable = false;
        powerManagement.enable = false;
        open = false;
      };

      # Blacklist NVIDIA modules so kernel never loads them
      boot.blacklistedKernelModules = [
        "nvidia"
        "nvidia_drm"
        "nvidia_modeset"
        "nvidia_uvm"
        "nouveau"
      ];

      services.udev.extraRules = ''
        # Put NVIDIA GPU into auto-suspend
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{power/control}="auto"
      '';
    };
  };
}
