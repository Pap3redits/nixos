{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    cmake
    gnumake
    libtool
    gopls
    gomodifytags
    gotests
    gore
    shellcheck
    discount
    ispell
  ];

  programs.zed-editor = {
    enable = true;
    extraPackages = [ pkgs.nixd pkgs.nix-ld];
    userSettings = {
     theme = lib.mkForce "Rosé Pine";

    };
  };
}
