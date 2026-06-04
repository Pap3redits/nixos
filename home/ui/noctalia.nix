/*
  { pkgs, inputs, ... }:
  {
    # install package
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      # ... maybe other stuff
    ];
  }
*/

{ pkgs, inputs, ... }:
{
  home-manager.users.christian = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        settingsVersion = 0;
        bar = {
          barType = "simple";
          position = "top";
          widgets = {
            left = [
              {
                id = "ControlCenter";
              }
              {
                id = "Workspace";
              }
              {
                id = "SystemMonitor";
              }
            ];
            center = [
              {
                id = "MediaMini";
              }
            ];
            right = [
              {
                id = "Tray";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "Volume";
              }
              {
                id = "Clock";
              }
              {
                id = "NotificationHistory";
              }
            ];
          };
          mouseWheelAction = "none";
          reverseScroll = false;
          mouseWheelWrap = true;
          middleClickAction = "none";
          middleClickFollowMouse = false;
          middleClickCommand = "";
          rightClickAction = "controlCenter";
          rightClickFollowMouse = true;
          rightClickCommand = "";
          screenOverrides = [ ];
        };
      };
    };
  };
}
