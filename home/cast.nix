{config, pkgs, ...}:{
  
  
  home.packages = with pkgs; [
    xdg-desktop-portal-gnome
    ffmpeg
    dnsmasq
    gst_all_1.gst-plugins-good
    libva
    gst_all_1.gst-vaapi
    faac
    wpa_supplicant
    openh264
    gnome-network-displays
  ];








}
