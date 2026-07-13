{config, pkgs, ...}:
{

  xdg.configFile."doom" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/shared/emacs.nix";
    force = true;
    recursive = true;
  };



}
