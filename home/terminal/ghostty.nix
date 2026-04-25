{config , pkgs, ...}:{


  programs.ghostty = {
    enable = true;
    settings = {
        #theme = everforest-dark;

        font-family = "Iosevka Nerd Font";
        font-style = "Regular";
        font-size = 15;

        window-padding-x = 14;
        window-padding-y = 14;
        confirm-close-surface = false;
        resize-overlay = "never";

        # Cursor  styling
        cursor-style = "bar";
        cursor-style-blink = false;
        shell-integration-features = "no-cursor";

      };
    };

}
