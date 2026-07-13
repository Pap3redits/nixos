{config, pkgs, ...}:
{

  xdg.configFile."doom" = {
<<<<<<< HEAD
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/shared/emacs.nix";
=======
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/shared/doom";
>>>>>>> e6aa675 (added doom emacs config)
    force = true;
    recursive = true;
  };



}
