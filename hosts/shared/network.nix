{ config, pkgs, ... }:
{
networking = {

  firewall.enable = false;
  firewall.checkReversePath = false;

  networkmanager.enable = true;
  networkmanager.dns = "systemd-resolved";
};
  services.resolved.enable = true;

  nix.settings.substituters = [
    "https://nix-community.cachix.org"
    "https://noctalia.cachix.org"
    "https://psysonic.cachix.org"
  ];

  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    "psysonic.cachix.org-1:M9cQyQ7tgvUWOQ5Pyt8ozlMoPLtOZir6MfRuTH9/VYA="
  ];


}
