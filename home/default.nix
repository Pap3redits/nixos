{
  config,
  pkgs,
  inputs,
  ...
}:

{

  home.username = "christian";
  home.homeDirectory = "/home/christian";

  home.packages = with pkgs; [
    ripgrep
    kitty
    eza
    fzf
    bat
    gcc
    lazygit
    fd
    nerd-fonts.iosevka
    fastfetch
    btop
    protonplus
    inxi
    pipewire
    wireplumber
    zoxide
    mpv
    hyprshot
    kdePackages.filelight
    wgnord
    ticktick
    go
    discord
    wireguard-tools
    psmisc
    teams-for-linux
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
    zed-editor
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
    kdePackages.kcalc
    yt-dlp
    rpi-imager
    bottles
    wl-clipboard
    matugen
    hyprlauncher
    trash-cli
    gparted-full
    hyprpolkitagent
    util-linux
    qt6Packages.qt6ct
    evolution
    obs-studio
    gnome-keyring
  ];

  #programs.doom-emacs = {
  #  enable = true;
  #  doomDir = inputs.doom-config;
  #};

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Christian Schmidt";
        email = "pap3redits@gmail.com";
      };
    };
  };


  imports = [
    ./terminal/shell.nix
    ./terminal/ghostty.nix
    ./terminal/zoxide.nix
    ./terminal/yazi.nix
    ./terminal/clipse.nix
    ./terminal/nvim.nix
    #./ui/hyprland.nix
    ./ui/hyprland_test.nix
    ./ui/wofi.nix
    ./ui/hyprpanel.nix
    ./ui/waybar.nix
    ./cast.nix
    #./zen.nix
  ];
  
  #enables bluetooth audio control
  services.mpris-proxy.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  

  home.stateVersion = "25.05";
}
