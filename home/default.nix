{
  pkgs,
  ...
}:

{

  home = {
    username = "christian";
    homeDirectory = "/home/christian";

    packages = with pkgs; [
      ripgrep
      kitty
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
      discord-development
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
      winetricks
      wine64
      wine-wayland
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
      #TODO wf-recorder test install at a later date
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
      rose-pine-cursor
      betterdiscordctl
      rose-pine-icon-theme
      hyprtoolkit
      base16-schemes
      protonmail-desktop
      signal-desktop
      mediainfo
      ffmpeg
      usbutils
      unzip
      nodejs # nvim
      cargo # nvim
      statix # nvim
      tsx # nvim
      nixfmt # nvim
      emacs
      streamlink-twitch-gui-bin
      easyeffects
      lsfg-vk-ui
      bottles
      runelite
      emacs
      deadlock-mod-manager
      lufus
      pangolin-cli
      file
      jq
      tldr
      feishin
    ];
  };
  imports = [
    ./shared/terminal/shell.nix
    ./shared/terminal/ghostty.nix
    ./shared/terminal/zoxide.nix
    ./shared/terminal/yazi.nix
    ./shared/terminal/btop.nix
    ./shared/terminal/fzf.nix
    ./shared/git.nix
    ./shared/emacs.nix
    ./ui/hyprland-ira-domini.nix
    ./ui/hyprland-nox-nostra.nix
    ./ui/hyprland-itani-lo-sahn.nix
  ];

  #enables bluetooth audio control
  services.mpris-proxy.enable = true;

#auto mounts usb drives
  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
            file_manager = "${pkgs.ghostty}/bin/ghostty -e ${pkgs.superfile}/bin/superfile";
      };
    };
  };

  home.stateVersion = "25.05";
}
