{ inputs, ... }:
{
  home-manager.users.christian = {
    imports = [
      inputs.noctalia.homeModules.default
      ./fhs.nix
    ];

    programs.noctalia = {
      enable = true;
      settings = ../../home/conf/noctalia/noctalia-nox-nostra.toml;
    };
  };
}
