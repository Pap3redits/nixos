{pkgs, ...}:
{
  home.packages = with pkgs; [
    cmake
    gnumake
    gopls
    gomodifytags
    gotests
    gore
    shellcheck
    discount
  ];
}
