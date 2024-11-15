{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      next.key = "<TAB>";
      previous.key = "<S-TAB>";
      close.key = "<leader>bd";
    };
    settings = {
      sidebar_filetypes = {
        # neotree = {
        #   text = "Neo-tree";
        # };
        neo-tree = {
          event = "BufWipeout";
        };
      };
    };
  };
}
