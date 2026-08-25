{pkgs, ...}:
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
  ];
}
