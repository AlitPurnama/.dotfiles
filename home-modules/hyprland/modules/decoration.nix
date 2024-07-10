{ ... }: {
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 6;
      blur = {
        enabled = true;
        size = 6;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
      };
    };
  };
}
