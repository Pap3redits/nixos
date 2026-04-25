{ ... }:
{

  programs.zed-editor = {
    enable = true;

    extensions = [
      "hyprlang"
      "Git Firefly"
      "Nix"
      "toml"
    ];

    hour_format = "hour24";

  };

}
