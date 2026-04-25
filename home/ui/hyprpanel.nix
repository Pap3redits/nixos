{ config, pkgs, ... }:
{


  xdg.configFile."hyprpanel" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/hyprpanel";
    force = true;
    recursive = true;
  };

}
