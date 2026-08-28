{ config, pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.stremio.Stremio"
      "app.zen_browser.zen"
#      "org.jeffvli.feishin"
      "io.github.arunsivaramanneo.GPUViewer"
      "io.github.nokse22.minitext"
      "com.adamcake.Bolt"
      "com.dec05eba.gpu_screen_recorder"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
  


}
