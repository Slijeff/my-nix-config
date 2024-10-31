{
    imports = [
        ./barbar.nix
    ];

    programs.nixvim = {
        colorschemes = {
      catppuccin.enable = true;
    };


        plugins = {
            web-devicons.enable = true;

            gitsigns = {
                enable = true;
                settings.sings = {
                    add.text = "+";
                    change.text = "~";
                };
            };

            nvim-autopairs.enable = true;
            oil.enable = true;
        };
    };
}
