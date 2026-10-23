{ pkgs, inputs, ... }:
let
  superfile-patched = inputs.superfile.packages.${pkgs.system}.default.overrideAttrs (old: {
    GOTOOLCHAIN = "local";
  });
in
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

    appimage.enable = true;
    appimage.binfmt = true;
  };
  users.defaultUserShell = pkgs.zsh;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #gpu-screen-recorder.enable = true;

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
    gamescope
    lutris
    superfile-patched
    hyprlandPlugins.hypr-dynamic-cursors
    keepassxc
    gnome-keyring
    inputs.zen-browser.packages."${pkgs.system}".default
  ];

  security.polkit.enable = true;
  security.polkit.enablePkexecWrapper = true;
}
