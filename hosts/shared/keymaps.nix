{
  programs.nvf.settings.vim.keymaps = [
    {
      desc = "Semicolon";
      mode = "i";
      key = "<C-;>";
      action = "<Right>;";
    }
    {
      desc = "Next Char";
      mode = "i";
      key = "<C-l>";
      action = "<Right>";
    }
    {
      desc = "Prev Char";
      mode = "i";
      key = "<C-h>";
      action = "<Left>";
    }
    {
      desc = "Explorer";
      mode = "n";
      key = "<leader>e";
      action = ":lua Snacks.explorer.open()<cr>";

    }
    {
      desc = "Find File";
      mode = "n";
      key = "<leader><space>";
      action = ":lua Snacks.picker.files()<cr>";
    }
    {
      desc = "Go to Left Window";
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
    }
    {
      desc = "Go to Right Window";
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
    }
    {
      desc = "Split Window Vertical";
      mode = "n";
      key = "<leader>wv";
      action = "<C-W>v";
    }
    {
      desc = "Split Window Horizontal";
      mode = "n";
      key = "<leader>wh";
      action = "<C-W>s";
    }
    {
      desc = "Prev Buffer";
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
    }
    {
      desc = "Next Buffer";
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
    }
    {
      desc = "Delete Current Buffer";
      mode = "n";
      key = "<leader>bd";
      action = ":lua Snacks.bufdelete()<cr>";
    }
    {
      desc = "Terminal (cwd)";
      mode = "n";
      key = "<leader>fT";
      action = ":lua Snacks.terminal()<cr>";
    }
    {
      desc = "Save File";
      mode = ["n" "i" "x" "s"];
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
    }

  ];
}
