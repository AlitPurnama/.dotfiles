{ pkgs, ... }: {
  imports = [ ./obs.nix ];
  home.packages = with pkgs; [
    xdg-desktop-portal
    gamemode
    mangohud
    python3
    motrix
    mullvad-browser
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" "FiraCode" ]; })
    zathura
    atuin
    zip
    armcord

    firefox-unwrapped
    unrar
    onlyoffice-bin
    ripgrep
    fastfetch
    wireplumber
    lazygit
    mpv
    ani-cli
    dunst
    libsForQt5.ark
    bottles

    mongodb-compass
    nodePackages.nodejs
    corepack

    pyprland

    godot_4

    nautilus

    eog

  ];
}
