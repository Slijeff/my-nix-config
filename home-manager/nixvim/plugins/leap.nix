{
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
    plugins.leap = {
      enable = true;
      addDefaultMappings = false;
    };
  };
}
