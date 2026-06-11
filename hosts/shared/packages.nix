{ pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;
  programs = {
    hyprland.enable = true;
    hyprland.withUWSM = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    zsh.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;


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
    quickshell
    evtest
    libsecret
    zsh
    sddm-astronaut
    nix-init
  ];

}
