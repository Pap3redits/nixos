{ inputs, ... }:
{
  home-manager.users.christian = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        bar = {
          barType = "simple";
          middleClickAction = "none";
          middleClickFollowMouse = false;
          moumouseWheelWrap = true;
          order = ["widgets"];
          position = "top";
          reverseScroll = false;
          rightClickAction = "controlCenter";
          rightClickCommand = "";
          rightClickFollowMouse = true;
          screenOverrides = [];
          mouseWheelAction = "none";
          widgets = {
            capsule = true;
            center = ["media"];
            end = ["tray" "bluetooth" "volume" "clock" "notifications"];
            margin_ends = 10;
            start = ["workspaces" "cpu" "ram"];
            monitor.DP-10 = {
              center = ["audio_visualizer"];
              end = [];
              start = ["workspaces"];
            };
            left.id = ["Workspace" "SystemMonitor"];
            right.id = ["Tray" "Bluetooth" "Volume" "Clock" "NotificationHistory"];
          };
        };
        widget.media = {
          hide_when_no_media = true;
          max_length = 500;
        };
        widget.tray.drawer = true;
        shell = {
          settings_show_advanced = true;
          telemetry_enabled = false;
          polkit_agent = true;
          panel.open_near_click_control_center = true;
        };
        theme.builtin = "Rosé Pine";
        weather = {
          unit = "imperial";
          enabled = true; 
          refresh_minutes = 30;
          effects = true;
        };
        notification.monitors = "DP-9";
      };
    };
  };
}
