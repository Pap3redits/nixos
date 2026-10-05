{
  pkgs,
  inputs,
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
  };
}
