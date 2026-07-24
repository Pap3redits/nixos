{
  pkgs,
  lib,
  config,
  ...
}:
{


  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    plugins = {
      inherit (pkgs.yaziPlugins) mount recycle-bin;
    };
    settings = {
      keymap = lib.importTOML ../../conf/yazi/keymap.toml;
      #theme = lib.importTOML ../conf/yazi/theme.toml;
    };
    theme = {
      flavor = {
        dark = "rose-pine";
      };
    };
    flavors = {rose-pine = ../../conf/yazi/rose-pine.yazi;};

  };

  xdg.configFile."superfile" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/conf/superfile";
    force = true;
    recursive = true;


  };
  xdg.portal = {
    enable = true;
    config.common.default = [ "hyprland" "gtk" ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-termfilechooser
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome

    ];

  };

  xdg.portal.config.common = {
    "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
  };

  home.sessionVariables.TERMCMD = "ghostty --class=file_chooser";

  xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
    force = true;
    text = ''
      [filechooser]
      cmd=superfile-wrapper.sh
      env=TERMCMD="ghostty -e"
    '';
  };


   xdg.configFile."xdg-desktop-portal-termfilechooser/superfile-wrapper.sh" = {
    force = true;
    executable = true;
    text = ''
      #!/usr/bin/env sh
      # This wrapper script is invoked by xdg-desktop-portal-termfilechooser.
      # For more info read `xdg-desktop-portal-termfilechooser(5)`.
      multiple="$1"
      directory="$2"
      save="$3"
      path="$4"
      out="$5"
      debug="$6"

      set -e
      [ "$debug" = 1 ] && set -x

      cmd="superfile"
      termcmd="''${TERMCMD:-kitty --title termfilechooser}"

      # superfile's --chooser-file mode writes the selected path(s) to $out
      if [ "$save" = "1" ]; then
          set -- --chooser-file="$out" "$path"
      elif [ "$directory" = "1" ]; then
          set -- --chooser-file="$out" "$path"
      elif [ "$multiple" = "1" ]; then
          set -- --chooser-file="$out" "$path"
      else
          set -- --chooser-file="$out" "$path"
      fi

      command="$termcmd $cmd"
      for arg in "$@"; do
          escaped=$(printf "%s" "$arg" | sed 's/"/\\"/g')
          command="$command \"$escaped\""
      done

      sh -c "$command"
    '';
  };

}
