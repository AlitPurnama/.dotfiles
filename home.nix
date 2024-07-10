{ lib, config, pkgs, ... }:

{
  imports = [ ./home-modules ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tenslime";
  home.homeDirectory = "/home/tenslime";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "video-x-matroska" = [ "mpv-2.desktop" ];
        "application/zip" = [ "org.kde.ark.desktop" ];
        "image/jpeg" = [ "org.gnome.eog.desktop" ];
        "image/png" = [ "org.gnome.eog.desktop" ];
        "image/gif" = [ "org.gnome.eog.desktop" ];
        "image/bmp" = [ "org.gnome.eog.desktop" ];
        "image/tiff" = [ "org.gnome.eog.desktop" ];
        # Docs
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
          [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" =
          [ "onlyoffice-desktopeditors.desktop" ];
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
          [ "onlyoffice-desktopeditors.desktop" ];
      };
      associations.added = {

      };
      associations.removed = {

      };
    };
  };

  dconf.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  services.dunst.enable = true;

  home.file = { };

  home.sessionVariables = { EDITOR = "nvim"; };

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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
