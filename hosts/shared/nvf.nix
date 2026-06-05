{  
  imports = [./keymaps.nix];

  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        lsp.enable = true;
        lsp.trouble.enable = true;


        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableTreesitter = true;
          nix.enable = true;
          nix.lsp.enable = true;
          nix.format.enable = true;
          lua.lsp.lazydev.enable = true;
        };
        
        mini.ai.enable = true;
        binds.whichKey.enable = true;
        tabline.nvimBufferline.enable = true;
        mini.icons.enable = true;

        terminal.toggleterm.enable = true;
        terminal.toggleterm.lazygit.enable = true;
        terminal.toggleterm.lazygit.mappings.open = "<leader>gg";
        diagnostics.enable = true;
        diagnostics.nvim-lint.enable = true;
        diagnostics.nvim-lint.lint_after_save = true;

        utility.snacks-nvim.enable = true;
        utility.snacks-nvim.setupOpts = {
          explorer = {};
          picker = {};
          input = {};
          dashboard = {};
          terminal = {};
          toggle = {};
          lazygit = {};
        };

        

        utility.grug-far-nvim.enable = true;

        notes.todo-comments.enable = true;

        projects.project-nvim.enable = true;
        dashboard.dashboard-nvim.enable = true;

        /*keymaps = [
          {
            desc = "Explorer";
            mode = "n";
            key = "<leader>e";
            action = ":lua Snacks.explorer.open()<CR>";

          }
        ];*/
    };
    };
  };
}
