{ lib, ... }:
{
  services = {

    displayManager.noctalia-greeter.enable = true;

    gnome.gnome-keyring.enable = true;
    elephant.enable = true;

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
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="d028", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
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

    timesyncd.enable = true;
  };
  hardware.bluetooth.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # virtualisation.virtualbox.host.enable = true;
  # users.extraGroups.vboxusers.members = [ "christian" ];

  virtualisation.docker.enable = true;

 # REMOVE AND NO LONGER NEEDED
  nixpkgs.overlays = [
    (final: prev: {
      hyprlandPlugins = prev.hyprlandPlugins // {
        hypr-dynamic-cursors =
          prev.hyprlandPlugins.hypr-dynamic-cursors.overrideAttrs (old: {
            version = "0-unstable-2026-10-05";
            src = prev.fetchFromGitHub {
              owner = "VirtCode";
              repo = "hypr-dynamic-cursors";
              rev = "2a8d0b735328d874a78ca93b2f201649f712a74a";
              hash = "sha256-PSt/SRtemvsoGYNFJ7YLiXGxT8EJe3AhmGwt5Vt79aA=";
            };
          });
      };
    })
  ];

}
