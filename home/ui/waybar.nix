{ config, pkgs, ... }:
{

  xdg.configFile."waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/home/conf/waybar";
    force = true;
    recursive = true;
  };
}
