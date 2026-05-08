{
  pkgs,
  lib,
  inputs,
  ...
}:
{

  home.packages = with pkgs.yaziPlugins; [
    mount
  ];


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

 

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-termfilechooser
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
      cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
      env=TERMCMD="ghostty -e"
    '';
  };

}
