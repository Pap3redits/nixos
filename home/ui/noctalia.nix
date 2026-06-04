{ inputs, ... }:
{
  home-manager.users.christian = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia = {
      enable = true;
      settings = ../conf/noctalia.toml;
    };
  };
}
