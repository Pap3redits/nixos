{pkgs, ...}:
{


xdg.desktopEntries.statlocker-companion = {
    name = "Statlocker Companion";
    exec = "${(pkgs.callPackage ./statlocker-companion.nix { })}/bin/statlocker-companion";
    icon = "statlocker-companion";
    categories = [ "Game" "Utility" ];
    terminal = false;
  };


xdg.desktopEntries.en-croissant = {
    name = "En-Croissant";
    exec = "${(pkgs.callPackage ./en-croissant.nix { })}/bin/en-croissant";
    icon = "en-croissant";
    categories = [ "Game" "Utility" ];
    terminal = false;
  };
}
