{ config, pkgs, ... }:
{


  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/nvim";
    force = true;
    recursive = true;
  };


}
