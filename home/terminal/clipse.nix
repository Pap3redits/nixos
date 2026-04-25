{ config, pkgs, ... }:
{


  xdg.configFile."clipse" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos_config/home/conf/clipse";
    force = true;
    recursive = true;
  };


}
