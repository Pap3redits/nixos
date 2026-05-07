{ config, pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.stremio.Stremio"
      "app.zen_browser.zen"
      "org.jeffvli.feishin"
      "io.github.arunsivaramanneo.GPUViewer"
      "io.github.nokse22.minitext"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
  


}