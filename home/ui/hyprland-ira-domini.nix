{ config, pkgs, lib, osConfig, ... }:
lib.mkIf (osConfig.networking.hostName == "ira-domini")
{


  #gtk.gtk4.theme = null;

  #wayland.windowManager.hyprland = {
  #  enable = true;
  #  package = null;
  #  portalPackage = null;
  #};

  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/hyprland/ira-domini/hypr";
    force = true;
    recursive = true;
  };

  programs.hyprlock.enable = true;
  stylix.targets.hyprlock.enable = false;
  /*
    services.hyprpaper = {
      enable = true;
      settings.splash = false;
      settings.wallpaper = [
        {
          monitor = "";
          path = "/etc/nixos/assets/wallpapers/polyscape_pillars_2.png";

        }
      ];
    };
  */

}
