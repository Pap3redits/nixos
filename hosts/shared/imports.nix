{ config, pkgs, ... }:
{
  imports = [
    ./stylix.nix
    ./flatpak.nix
    ./network.nix
    ./packages.nix
    ./services.nix
    ./boot.nix
    ./env.nix
  ];
  


}