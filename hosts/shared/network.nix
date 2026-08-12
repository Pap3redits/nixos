{ config, pkgs, ... }:
{
networking = {

  firewall.enable = false;
  firewall.checkReversePath = false;

  networkmanager.enable = true;
  networkmanager.dns = "systemd-resolved";
};
  services.resolved.enable = true;


}
