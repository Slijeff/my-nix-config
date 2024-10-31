{nixvim, ...}: {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;

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
