{
  ...
}:
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
  ];

  nix.settings = {
    extra-substituters = [ "https://grimoire.cachix.org" ];
    extra-trusted-public-keys = [ "grimoire.cachix.org-1:5Y9dQ9wk9z4BsOnkv9t8ULcsnnaJ1zSMnzOd1dV5QbA=" ];
  };

  nix.settings.trusted-users = ["christian"];

  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
  ];

  programs.localsend = {
      enable = true;
      openFirewall = true;
    };
}
