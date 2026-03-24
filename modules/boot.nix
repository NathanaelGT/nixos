{ pkgs, lib, ... }:

{
  boot = {
    tmp.useTmpfs = true;

    loader = {
      timeout = 0;
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        editor = false;
        consoleMode = "0";
      };
    };

    initrd.verbose = false;

    consoleLogLevel = 0;

    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

    kernelParams = [
      "quiet"                      # suppress most kernel logs
      "loglevel=3"                 # only show errors
      "udev.log_level=3"           # silence udev logs
      "vt.global_cursor_default=0" # hide the blinking cursor
      "preempt=full"
      "nvidia_drm.modeset=1" 
      "nvidia_drm.fbdev=1"
      "nowatchdog"
      "fastboot"
    ];
  };

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    extraArgs = lib.mkDefault [ "--performance" ];
  };
    
  specialisation = {
    bluetooth.configuration = {
      system.nixos.tags = [ "bluetooth" ];

      hardware.bluetooth.enable = true;

      networking.networkmanager.wifi.macAddress = "random";
    };

    on-the-go.configuration = {
      system.nixos.tags = [ "on-the-go" ];

      hardware.bluetooth.enable = true;

      hardware.nvidia-container-toolkit.enable = false;

      networking.networkmanager.wifi.macAddress = "random";

      services.scx.extraArgs = [ "--powersave" ];

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
