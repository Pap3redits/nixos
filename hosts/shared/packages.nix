{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    git
    kitty
    kdePackages.qtmultimedia # needed for the sddm theme
    nfs-utils
    clipse
    wayle
    quickshell
  ];

  programs.neovim = {
  enable = true;
  defaultEditor = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


}