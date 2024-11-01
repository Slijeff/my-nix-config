{

    programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>?";
        action = "require('which-key').show({ global = false })";
        options.silent = true;
      }
  ];
    
    plugins.which-key = {
        enable = true;
    };
};



};
