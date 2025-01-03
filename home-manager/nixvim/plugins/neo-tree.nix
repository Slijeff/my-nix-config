{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>n";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
      }
    ];

    plugins.neo-tree = {
      enable = true;

      filesystem = {
        filteredItems = {
          hideDotfiles = false;
          visible = true; # enabled means all "hide" are dimmed
        };
        useLibuvFileWatcher = true;
        followCurrentFile.enabled = true;
      };

      closeIfLastWindow = true;
      window = {
        width = 30;
        autoExpandWidth = false;
      };
    };
  };
}
