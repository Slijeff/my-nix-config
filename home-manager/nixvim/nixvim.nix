{nixvim, ...}: {
  imports = [
    nixvim.homeManagerModules.nixvim
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

    colorschemes = {
      catppuccin.enable = true;
    };

    plugins = {
      lualine = {
        enable = true;
      };

      lazygit = {
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
