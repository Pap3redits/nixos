{ config, ... }:
{

  xdg.configFile."doom" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/doom";
    force = true;
    recursive = true;
  };



}
