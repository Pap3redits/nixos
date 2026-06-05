{
  programs.nvf.settings.vim.keymaps = [
    {
      desc = "Explorer";
      mode = "n";
      key = "<leader>e";
      action = ":lua Snacks.explorer.open()<CR>";

    }
    {
      desc = "Find File";
      mode = "n";
      key = "<leader><space>";
      action = ":lua Snacks.picker.files()<CR>";
    }
  ];
}