{pkgs, ...}:
{


xdg.desktopEntries.statlocker-companion = {
    name = "Statlocker Companion";
    exec = "${(pkgs.callPackage ./statlocker-companion.nix { })}/bin/statlocker-companion";
    icon = "statlocker-companion";
    categories = [ "Game" "Utility" ];
    terminal = false;
  };
}
