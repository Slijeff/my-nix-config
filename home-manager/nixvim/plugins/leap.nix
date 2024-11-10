{
  # Collection of various small independent plugins/modules
  # https://nix-community.github.io/nixvim/plugins/mini.html
  programs.nixvim = {
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<CR>";
        action = "<Plug>(leap)";
        options.silent = true;
        options.desc = "leap";
      }
    ];
    plugins.leap= {
      enable = true;
      addDefaultMapping = false;
    };
  };
}
