{nixvim, ...}: {
  imports = [
    nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
    ./keymappings.nix
    ./completion.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    performance = {
      combinePlugins = {
        enable = false;
        standalonePlugins = [
          "nvim-treesitter"
          "conform-nvim"
          "oil"
        ];
      };
      byteCompileLua.enable = true;
    };

    plugins = {
      lualine = {
        enable = true;
      };
    };
  };
}
