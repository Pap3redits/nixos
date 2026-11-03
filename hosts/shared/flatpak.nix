{ config, pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      "com.stremio.Stremio"
      "app.zen_browser.zen"
      "io.github.arunsivaramanneo.GPUViewer"
      "io.github.nokse22.minitext"
      "com.adamcake.Bolt"
      "com.dec05eba.gpu_screen_recorder"
      "com.collaboraoffice.Office"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
 # sets the timezone env variable for zen browser
  systemd.tmpfiles.rules = [
    "d /var/lib/flatpak/overrides 0755 root root -"
    ''f+ /var/lib/flatpak/overrides/app.zen_browser.zen 0644 root root - [Environment]\nTZ=America/New_York\n''
  ];

}
