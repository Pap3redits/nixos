{ config, pkgs, ... }:
{

  services.elephant.enable = true;

  services.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
   services.xserver.enableTCP = true;

   services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";

  };
  
  services.mullvad-vpn = {
    enable = true;
  };

  services.udisks2.enable = true;

  services.udev.extraRules = ''
  KERNEL=="uinput", MODE="777", GROUP="input", OPTIONS+="static_node=uinput"
  '';

  services.upower.enable = true;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "lock";
  };

  services.openssh.enable = true;

  services.avahi.enable = true;

  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "christian" ];
  
}