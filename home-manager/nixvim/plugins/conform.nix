{config, ...}: {
  programs.nixvim = {
    keymaps = [
      {
        # action = config.lib.nixvim.mkRaw ''require("conform").format()'';
        action = '':lua require("conform").format()<CR>'';
        key = "<leader>bf";
        options = {
          silent = false;
          desc = "Format buffer";
        };
      }
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          yaml = ["yamlfix"];
        };
        formatters = {
          yamlfix = {
            env = {
              YAMLFIX_EXPLICIT_START = "false";
              YAMLFIX_SEQUENCE_STYLE = "block_style";
            };
          };
        };
      };
    };
  };
}
