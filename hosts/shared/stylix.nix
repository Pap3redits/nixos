{ config, pkgs, ... }:
{
  


  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    cursor.name = "BreezeX-RosePine-Linux";
    cursor.package = pkgs.rose-pine-cursor;
    cursor.size = 20;
  };
}