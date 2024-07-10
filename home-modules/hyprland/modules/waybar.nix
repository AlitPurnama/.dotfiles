{ inputs, pkgs, ... }:
let height = 36;
in {

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        name = "top_bar";
        layer = "top";
        position = "top";
        spacing = 4;
        height = 30;

        margin-top = 5;
        margin-left = 15;
        margin-right = 15;

        modules-left = [ "hyprland/workspaces" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = " ";
            "2" = " ";
            "3" = " ";
            "4" = " ";
            #activate = "";
            #default = "";
            #empty = "";
          };

          persistent_workspaces = { "*" = 4; };
        };

      };

    };
    style = ''

      window.waybar.top_bar {
        background: alpha(@base00, 0.0);
      }



    '';
  };
}
