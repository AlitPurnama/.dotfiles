# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./system-modules
    inputs.aagl.nixosModules.default
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Jayapura";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  #programs.hyprland.enable = true;

  programs.wavey-launcher.enable = true;

  programs.sleepy-launcher.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    #displayManager.lightdm = {
    #  enable = true;
    #  extraSeatDefaults = ''
    #    autologin-user=tenslime
    #  '';
    #};
    displayManager.defaultSession = "xfce";
    desktopManager = {
      xterm.enable =  true;
      xfce.enable = true;
    };
    xkb = {
      variant = "";
      layout = "us";
    };
    #excludePackages = [ pkgs.xterm ];
  };

  services.flatpak.enable = true;
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
  };

  # Configure keymap in X11
  #services.xserver.xkb.layout = "us";
  #services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  virtualisation.waydroid.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    data-root = "/home/tenslime/Disks/Data/Docker";
  };

  hardware.graphics.enable32Bit = true;

  environment.variables = { ROC_ENABLE_PRE_VEGA = "1"; };

  programs.fish.enable = true;

  users.users.tenslime = {
    isNormalUser = true;
    extraGroups = [ "wheel" "autologin" "libvirtd" "docker" ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    eza
    lzip
    pciutils
    gh
    python3
    btop
    qemu
    ventoy
    motrix
    firefox
  ];

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  services.gvfs.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
      "spotify"
      "unrar"
      "davinci-resolve"
      "mongodb-compass"
    ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    protontricks.enable = true;
  };

  programs.gamemode.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

}
