{ config, pkgs, inputs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Christian Schmidt";
        email = "pap3redits@gmail.com";
      };
    };
  };



}