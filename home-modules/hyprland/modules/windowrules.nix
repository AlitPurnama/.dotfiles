{ pkgs, ... }:
let
  opacity-size = "0.9";
  opacity = "opacity ${opacity-size} ${opacity-size}";
in {

  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Xwayland screenshare
      "opacity 0.0 override,class:^(xwaylandvideobridge)"
      "noanim,class:^(xwaylandvideobridge)"
      "noinitialfocus,class:^(xwaylandvideobridge)"
      "maxsize 1 1,class:^(xwaylandvideobridge)"
      "noblur,class:^(xwaylandvideobridge)"
      #Browser 
      "opacity ${opacity},class:^(firefox)"
      "workspace 1 silent, class:^(firefox)$"
      "workspace r silent, class:^(firefox)$, title:^$(.*Upload*.)$"
      #Kitty
      "opacity ${opacity},class:^(kitty)"

      #Discord
      "opacity ${opacity},class:^(ArmCord)"

      # Nautilus
      "opacity ${opacity}, class:^(org.gnome.Nautilus)"

      # Steam
      "opacity 0.70 0.70,class:^([Ss]team)"
      "opacity 0.70 0.70,class:^(steamwebhelper)"

      # KDE POLKIT
      "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)"
      "float,class:^(org.kde.polkit-kde-authentication-agent-1)"

      "float, title:(Reference Tabs — Krita)"

      "fullscreen, class:^(Waydroid)"

      "float, title:(XtMapper)"
      "noblur, title:(XtMapper)"
      "size 100% 100%, title:(XtMapper)"
      "move 0 0, title:(XtMapper)"
      "stayfocused, title:(XtMapper)"

      "noblur, class:^(steam_app_244210)"

      "opacity 100 100, class:^(steam_app_244210)"

      "float, title:(quickgui)"
      "opacity 100 100, title:(quickgui)"

    ];
  };
}
