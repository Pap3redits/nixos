{
  inputs,
  osConfig,
  lib,
  ...
}:
lib.mkIf (osConfig.networking.hostName == "nox-nostra") {
  home-manager.users.christian = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = ../../home/conf/noctalia/noctalia-nox-nostra.toml;
    };
  };
}
