{
  imports = [
    ./barbar.nix
    ./neo-tree.nix
    ./telescope.nix
    ./which-key.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    colorschemes = {
      catppuccin.enable = true;
    };

    plugins = {
      web-devicons.enable = true;
      leap.enable = true;

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
