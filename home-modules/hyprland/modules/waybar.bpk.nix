{ config, pkgs, ... }:
let
  playerctl = "${pkgs.playerctl}/bin/playerctl";

  mpc = "${pkgs.mpc-cli}/bin/mpc";

  kitty = "${pkgs.kitty}/bin/kitty";

  launcher = pkgs.pkgs.writeShellScriptBin "launcher" ''
    if pgrep -x "rofi" > /dev/null; then
      ${pkgs.rofi-wayland}/bin/rofi
    else
      pkill rofi
    fi
  '';

  ellenLogo = ../../../wallpapers/chibi-ellen.png;
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        layer = "top";
        modules-left = [ "custom/launcher" "hyprland/workspaces" ];
        #modules-center = [ "custom/playerctl" ];
        modules-right =
          [ "mpd" "pulseaudio" "memory" "cpu" "network" "clock" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "〇";
            "focused" = "";
            "default" = "";
          };
        };
        clock = {
          interval = 60;
          align = 0;
          rotate = 0;
          tooltip-format = ''
            <big>{:%B %Y}</big>
            <tt><small>{calendar}</small></tt>'';
          format = "   {:%H:%M}";
          format-alt = " {:%a %b %d; %G}";

        };

        cpu = {
          format = "udb80udf5b {usage}%";
          interval = 1;
          on-click-middle = "${kitty} btop";
          on-click-right = "${kitty} btop";
        };

        "custom/launcher" = {
          format = " 󱄅 ";
          on-click = "${launcher}/bin/launcher";
          tooltip = false;
        };

        memory = {
          format = "udb83udee0 {percentage}%";
          interval = 1;
          states = { warning = 85; };
        };

        mpd = {
          interval = 2;
          unknown-tag = "N/A";
          format = "{stateIcon} {artist} - {title}";
          format-disconnected = " Disconnected";
          format-paused = "{stateIcon} {artist} - {title}";
          format-stopped = "Stopped ";
          state-icons = {
            "paused" = "";
            "playing" = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
          on-click = "${mpc} toggle";
          on-click-middle = "${mpc} prev";
          on-click-right = "${mpc} next";
          on-update = "";
          on-scroll-up = "${mpc} seek +00:00:01";
          on-scroll-down = "${mpc} seek -00:00:01";
          smooth-scrolling-threshold = 1;
        };

        network = {
          interval = 5;
          format-wifi = " {essid}";
          format-ethernet = " {ipaddr}/{cidr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "睊 Disconnected";
          format-disabled = "睊 Disabled";
          format-alt = " {bandwidthUpBytes} |  {bandwidthDownBytes}";
          tooltip-format = " {ifname} via {gwaddr}";
          on-click-middle = "nm-connection-editor";
          on-click-right = "kitty nmtui";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = " Mute";
          format-bluetooth = " {volume}% {format_source}";
          format-bluetooth-muted = " Mute";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          scroll-step = 5.0;
          on-click = "amixer set Master toggle";
          on-click-right = "pavucontrol";
          smooth-scrolling-threshold = 1;
        };
      };

      temperature = {
        format = "uf2c9 {temperatureC}u00b0C";
        tooltip = false;
      };

      tray = {
        icon-size = 15;
        spacing = 5;
      };
    };

    style = ''

      window.mainBar {
        margin-left: 10px;
      }

      #workspaces {
        margin-left: 10;
      }
      #custom-launcher {
        background-image: url("${ellenLogo}");
      }

    '';
  };

}
