{
  config,
  pkgs,
  inputs,
  lib,
  #nixosConfig,
  ...
}:

{

  home.username = "christian";
  home.homeDirectory = "/home/christian";

  home.packages = with pkgs; [
    ripgrep
    kitty
    eza
    bat
    gcc
    lazygit
    fd
    nerd-fonts.iosevka
    fastfetch
    protonplus
    inxi
    pipewire
    wireplumber
    zoxide
    mpv
    hyprshot
    kdePackages.filelight
    wgnord
    go
    discord
    wireguard-tools
    psmisc
    google-chrome
    networkmanagerapplet
    dxvk
    vkd3d
    vulkan-tools
    obsidian
    appimage-run
    wine
    winetricks
    protontricks
    pavucontrol
    tailscale
    nix-ld
    nil
    nixd
    hyprnotify
    libnotify
    hyprpaper
    nh
    nvtopPackages.full
    onlyoffice-desktopeditors
    vlc
    wf-recorder
    yazi
    cpx
    vscodium
    python3
    yt-dlp
    wl-clipboard
    trash-cli
    gparted-full
    hyprpolkitagent
    util-linux
    qt6Packages.qt6ct
    obs-studio
    gnome-keyring
    rose-pine-cursor
    betterdiscordctl
    rose-pine-gtk-theme
    rose-pine-icon-theme
    hyprtoolkit
    base16-schemes
    walker
    protonmail-desktop
    signal-desktop
    davinci-resolve
    mediainfo
    ffmpeg
    usbutils
  ];

  imports = [
    ./shared/terminal/shell.nix
    ./shared/terminal/ghostty.nix
    ./shared/terminal/zoxide.nix
    ./shared/terminal/yazi.nix
    ./shared/terminal/clipse.nix
    ./shared/terminal/nvim.nix
    ./shared/terminal/btop.nix
    ./shared/terminal/fzf.nix
    ./shared/git.nix
    ../hosts/nox-nostra/wayle.nix
    ./ui/hyprland_test.nix
  ];
  
  #enables bluetooth audio control
  services.mpris-proxy.enable = true;

  

  home.stateVersion = "25.05";
}
