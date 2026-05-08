{ config, pkgs, lib, osConfig, ... }:
lib.mkIf (osConfig.networking.hostName == "nox-nostra")
{

  xdg.configFile."wayle" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/wayle-nox-nostra";
    force = true;
    recursive = true;
  };


}