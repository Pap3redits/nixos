{ config, pkgs, lib, osConfig, ... }:
lib.mkIf (osConfig.networking.hostName == "itani-lo-sahn")
{

  xdg.configFile."wayle" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/wayle-itani-lo-sahn";
    force = true;
    recursive = true;
  };



}