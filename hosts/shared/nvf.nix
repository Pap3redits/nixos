{lib, ...}:
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
        options = {
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
        };

        lazy.enable = true;
        lazy.enableLznAutoRequire = false;


        theme = {
          enable = true;
          transparent = lib.mkForce true;
          name = lib.mkForce "rose-pine";
          style = "main";
        };




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
        tabline.nvimBufferline = {
          enable = true;
          setupOpts.options.always_show_bufferline = false;
          setupOpts.options.numbers = "none";
        };
        session.nvim-session-manager.enable = true;
        session.nvim-session-manager.setupOpts.autoload_mode = "Disabled";
        

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
            sections = [
              { section = "header"; }
              {
                title = "Projects";
                pane = 1;
                key = "p";
                action = ":lua Snacks.picker.projects()";
                padding = 1;
              }
              {
                title = "Find File";
                pane = 1;
                key = "f";
                action = ":lua Snacks.dashboard.pick('files')";
                padding = 1;
              }
              {
                title = "New File";
                pane = 1;
                key = "n";
                action = ":ene | startinsert";
                padding = 1;
              }
              {
                title = "Restore Session";
                pane = 1;
                key = "s";
                action = ":SessionManager load_last_session";
                padding = 1;
              }
              {
                pane = 1;
                title = "Recent Files";
                key = "r";
                action = ":lua Snacks.dashboard.pick('oldfiles')";
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
