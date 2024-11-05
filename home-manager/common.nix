{
  config,
  pkgs,
  ...
}: {
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    uv
    yamlfix
    btop
    fastfetch
    lazygit
    wget
    # pnpm
    nodejs_22
    nodejs_22.pkgs.pnpm
    devbox
    just
    gdu
    git
    ripgrep
  ];

  home.file = {};
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/nix-config/";
      ee = "eza";
    };
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    oh-my-zsh = {
      enable = true;
      theme = "fino-time";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
    ];
  };

  programs.git = {
    enable = true;
    userEmail = "31459252+Slijeff@users.noreply.github.com";
    userName = "Jeffrey Hui";
    ignores = [
      "*~"
      ".DS_Store"
    ];
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "--all"
      "--group-directories-first"
      "--long"
    ];
  };

  programs.bat = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        ratio = [2 4 3];
        show_hidden = true;
      };
      preview = {
        ueberzug_scale = 1.5;
      };
    };
  };
}
