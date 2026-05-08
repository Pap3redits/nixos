{ config, pkgs, ... }:
{

  xdg.configFile."wayle" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/wayle-nox-nostra";
    force = true;
    recursive = true;
  };


}