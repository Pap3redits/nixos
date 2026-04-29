{ config, pkgs, ... }:
{


  programs.btop = {
    enable = true;
    themes {rose-pine = ../conf/btop/rose-pine.theme;};
  };
}