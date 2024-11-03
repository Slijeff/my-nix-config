{
  imports = [
    ./nvim-surround.nix
    ./conform.nix
    ./barbar.nix
    ./comment.nix
    ./lsp.nix
    ./lazygit.nix
    ./neo-tree.nix
    ./telescope.nix
    ./which-key.nix
    ./treesitter.nix
    ./floaterm.nix
  ];

  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          integrations = {
            cmp = true;
            gitsigns = true;
            treesitter = true;
            leap = true;
            neotree = true;
          };
        };
      };
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
      nvim-autopairs.enable = true;
      oil.enable = true;
    };
  };
}
