{ config, pkgs, ... }:
{

  networking.firewall.enable = false;
  networking.firewall.checkReversePath = false;

  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  services.resolved.enable = true;

}