# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.spicetify-nix.nixosModules.default
    inputs.nixos-cli.nixosModules.nixos-cli
  ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyrpland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    trusted-users = [ "root" "nathanaelgt" ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.tmp.useTmpfs = true;

  boot.loader.timeout = 1;
  boot.loader.systemd-boot.editor = false;

  boot.kernelParams = [
    "quiet"                  # suppress most kernel logs
    "loglevel=3"             # only show errors
    "udev.log_level=3"       # silence udev logs
    "vt.global_cursor_default=0" # hide the blinking cursor
  ];

  boot.consoleLogLevel = 3;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "Victus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nathanaelgt = {
    isNormalUser = true;
    description = "NathanaelGT";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "nathanaelgt";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.variables.EDITOR = "nvim";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pkgs.ntfs3g
    pkgs.fastfetch
    pkgs.neovim
    pkgs.btop
    pkgs.psmisc
    pkgs.nethogs
    pkgs.wget
    pkgs.kitty
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprpanel
    pkgs.rofi-wayland
    pkgs.catppuccin-gtk
    pkgs.catppuccin-cursors.mochaDark
    pkgs.brightnessctl
    pkgs.zellij
    pkgs.tmux
    pkgs.bun
    pkgs.mise
    pkgs.yazi
    pkgs.superfile
    pkgs.obsidian
    pkgs.vlc
    pkgs.fish
    pkgs.jetbrains.phpstorm
    pkgs.vscode
    pkgs.frankenphp
    pkgs.laravel
    pkgs.lutris

    pkgs.pavucontrol
    
    pkgs.libratbag
    pkgs.piper

    pkgs.playerctl

  wineWowPackages.stagingFull
  winetricks
  dxvk
    pkgs.bluetui
    pkgs.grim
    pkgs.slurp
    pkgs.satty
    pkgs.starship
    pkgs.ripgrep
    pkgs.zoxide
    pkgs.fzf
    pkgs.fd
    pkgs.speedtest-cli
    pkgs.libreoffice-qt6-fresh
    pkgs.ffmpeg
    pkgs.gcc
    pkgs.bison
    pkgs.re2c
    pkgs.pkg-config
    pkgs.libxml2
    pkgs.libxml2.dev
    pkgs.php
    pkgs.php84Extensions.opcache
    pkgs.php84Extensions.iconv
    pkgs.php84Packages.composer
    pkgs.bat
    pkgs.git-credential-manager
    pkgs.lazygit
    pkgs.wl-clipboard
    pkgs.feh
    pkgs.litecli
    pkgs.dua
    pkgs.eza
    pkgs.p7zip
    pkgs.jq
    pkgs.poppler
    pkgs.resvg
    pkgs.imagemagick
    pkgs.android-tools
    pkgs.scrcpy
    pkgs.jujutsu
    nvd
    nix-output-monitor
    pkgs.autoconf
    pkgs.mlocate
    pkgs.lshw
    pkgs.wineWowPackages.staging
    pkgs.gamemode
    pkgs.winetricks
    catppuccin-gtk
    inputs.zen-browser.packages."${system}".twilight
    pkgs.speechd

    (pkgs.bottles.override { removeWarningPopup = true; })
    
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    amdvlk
    driversi686Linux.amdvlk
    #config.boot.kernelPackages.nvidiaPackages.legacy_575
    pkgs.devenv
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    noto-fonts
  ];

  
  services.nixos-cli = {
    enable = true;
    config = {
      config_location = "/home/nathanaelgt/.config/nixos-config";
      use_nvd = true;

      aliases = {
        boot = [
          "apply"
          "--no-activate"
        ];
        build = [
          "apply"
          "--no-boot"
          "--no-activate"
          "--output"
          "./result"
        ];
        genlist = [
          "generation"
          "list"
        ];
        rollback = [
          "generation"
          "rollback"
        ];
        switch = [
          "generation"
          "switch"
        ];
        test = [
          "apply"
          "--no-boot"
          "--yes"
        ];
        testcfg = [
          "apply"
          "--no-boot"
          "--no-activate"
          "--yes"
        ];
      };
      apply = {
        use_nom = true;
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  programs.pay-respects.enable = true;
  programs.nix-index.enable = true;

  programs.fish.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.waybar = {
    enable = true;
  };


  programs.git = {
    enable = true;
    config = {
      credential.helper = "manager";
      user.name = "NathanaelGT";
      user.email = "gordontanu2004@gmail.com";
    };
  };

  programs.steam.enable = true;

  programs.spicetify = {
    enable = true;
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.extensions; [
      adblockify
      hidePodcasts
      shuffle
      copyToClipboard
      fullAppDisplay
    ];
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system}.themes.catppuccin;
    colorScheme = "mocha";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
    ];
  };

hardware.graphics = {
  enable = true;
  enable32Bit = true;

  extraPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
  ];

  extraPackages32 = with pkgs; [
    driversi686Linux.mesa
  ];
};

  services.upower.enable = true;
  
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };

  services = {
    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
      # jack = {
      #   enable = true;
      # };
      pulse = {
        enable = true;
      };
      wireplumber = {
        enable = true;
      };
    };
  };

  services.ratbagd.enable = true;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

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

  i18n.extraLocales = [ "id_ID.UTF-8/UTF-8" ];
  i18n.extraLocaleSettings = {
    LC_TIME = "id_ID.UTF-8";
  };
}
