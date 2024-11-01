{nixvim, ...}: {
  imports = [
    nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    plugins = {
      lualine = {
        enable = true;
      };

      telescope = {
        enable = true;
        extensions = {
          file-browser = {
            enable = true;
          };
        };
      };
    };
  };
}
