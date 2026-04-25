{ config, pkgs, ... }:
{

  #wayland.windowManager.hyprland = {
  #  enable = true;
  #  package = null;
  #  portalPackage = null;
  #};

  xdg.configFile."hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/home/conf/hypr";
    force = true;
    recursive = true;
  };

  programs.hyprlock.enable = true;
  /*services.hyprpaper = {
    enable = true;
    settings.splash = false;
    settings.wallpaper = [
      {
        monitor = "";
        path = "/etc/nixos/assets/wallpapers/polyscape_pillars_2.png";

      }
    ];
  };*/

}
