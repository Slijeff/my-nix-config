{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        options.silent = true;
        options.desc = "toggle lazygit";
      }
    ];

    plugins.lazygit = {
      enable = true;
    };
  };
}
