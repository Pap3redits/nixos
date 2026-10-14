
{ lib
, appimageTools
, fetchurl
}:

let
  pname = "statlocker-companion";
  version = "unstable-2026-10-14";

  src = fetchurl {
    name = "${pname}-${version}-amd64.AppImage";
    url = "https://updates.statlocker.gg/companion/download/statlocker-companion_amd64.AppImage";
    hash = "sha256-FTGcttiBrIQOX+xuinuAtc9fAiPi+rPOyOjynGGrU+w=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  meta = {
    description = "Desktop companion for Statlocker.gg — automatic Deadlock match tracking";
    homepage = "https://statlocker.gg/companion";
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
