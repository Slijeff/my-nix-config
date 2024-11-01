{
  imports = [
    ./barbar.nix
    ./neo-tree.nix
  ];

  programs.nixvim = {
    colorschemes = {
      catppuccin.enable = true;
    };

    plugins = {
      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };
      lazygit = {
        enable = true;
      };

      nvim-autopairs.enable = true;
      oil.enable = true;
    };
  };
}