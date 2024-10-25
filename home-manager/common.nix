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
    neovim
    btop
    fastfetch
    lazygit
    wget
    pnpm
    devbox
    just
    gdu
    git
  ];

  home.file = {};
  home.sessionVariables = {
    # EDITOR = "emacs";
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
      theme = "cloud";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
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
}
