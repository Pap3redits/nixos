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
        lsp.lspconfig.enable = true;

        lazy.enable = true;
        lazy.enableLznAutoRequire = false;



        statusline.lualine.enable = true;
        telescope.enable = true;

        languages = {
          nix.enable = true;
          nix.lsp.enable = true;
          nix.format.enable = true;
          lua.lsp.lazydev.enable = true;
        };
        
        mini.ai.enable = true;
        mini.pairs.enable = true;
        mini.icons.enable = true;
        binds.whichKey.enable = true;
        tabline.nvimBufferline.enable = true;
        

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
          dashboard = {
            preset = {
              keys = [
                {
                  key = "f";
                  desc = "Find File";
                  action = ":lua Snacks.dashboard.pick('files')";
                }
              ];
            };
            sections = [
              { section = "header"; }
              {
                pane = 1;
                title = "Actions";
                section = "keys";
                gap = 1;
                padding = 1;
              }
              {
                title = "Projects";
                pane = 1;
                key = "p";
                action = "<cmd>Telescope project<CR>";

              }
              {
                pane = 1;
                title = "Recent Files";
                section = "recent_files";
                limit = 8;
              }
            ];
          };
          terminal = {};
          toggle = {};
          lazygit = {};
        };
        
        git.gitsigns.enable = true;

        formatter.conform-nvim.enable = true;


        utility.grug-far-nvim.enable = true;
        utility.motion.flash-nvim.enable = true;

        ui.noice.enable = true;

        autocomplete.blink-cmp.enable = true;


        notes.todo-comments.enable = true;

        projects.project-nvim = {
          enable = true;

          setupOpts = {
            detection_methods = [ "pattern" ];
            #patterns = [ ".git" "flake.nix" "package.json" ];

            show_hidden = false;
          };
        };
      };
    };
  };
}
