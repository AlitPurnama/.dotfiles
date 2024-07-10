{ pkgs, userSettings, ... }:
let
in {
  stylix.enable = true;
  stylix.image = userSettings.wallpaper;
  stylix.polarity = "dark";
  stylix.autoEnable = true;
  #stylix.base16Scheme =
  # "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

  stylix.cursor = {
    size = 20;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };

  stylix.targets.plymouth = {
    logo = ../wallpapers/chibi-ellen.png;
    logoAnimated = false;
  };
}
