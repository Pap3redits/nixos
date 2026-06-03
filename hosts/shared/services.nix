{
  services = {

    elephant.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    xserver.enableTCP = true;

    tailscale = {
      enable = false;
      useRoutingFeatures = "client";

    };

    mullvad-vpn = {
      enable = true;
    };

    udisks2.enable = true;

    udev.extraRules = ''
      KERNEL=="uinput", MODE="777", GROUP="input", OPTIONS+="static_node=uinput"
    '';

    upower.enable = true;
    thermald.enable = true;
    auto-cpufreq.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "lock";
    };

    openssh.enable = true;

    avahi.enable = true;

    blueman.enable = true;
  };
  hardware.bluetooth.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "christian" ];

}
