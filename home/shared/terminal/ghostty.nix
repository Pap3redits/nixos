{ config, pkgs, ... }:
{

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Rose Pine";

      font-family = "Iosevka Nerd Font";
      font-style = "Regular";
      font-size = 15;

      window-padding-x = 32;
      window-padding-y = 32;
      confirm-close-surface = false;
      resize-overlay = "never";

      # Cursor  styling
      cursor-style = "bar";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";

      command = "/nix/store/*-user-environment/bin/nu";
      shell-integration = "nushell";

    };
  };
}
