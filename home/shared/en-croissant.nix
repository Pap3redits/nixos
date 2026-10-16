
{ lib
, appimageTools
, fetchurl
}:

let
  pname = "en-croissant";
  version = "0.15.1";

  src = fetchurl {
    name = "${pname}-${version}-amd64.AppImage";
    url = "https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v0.15.1/en-croissant_0.15.1_amd64.AppImage";
    hash = "sha256-KFsHDhzk+tUJHdYiwkzsSP3htJWhuRfUvFxg6tJS4cY=";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  meta = {
    description = "Chess engine";
    homepage = "https://encroissant.org/";
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
