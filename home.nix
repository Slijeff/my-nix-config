# home.nix

{ config, pkgs, ... }:

{

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    uv
    vim
    neovim
    zoxide
    btop
    fastfetch
    lazygit
    wget
    pnpm
    devbox
    fzf
    just
    gdu
    git
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
        switch = "darwin-rebuild switch --flake ~/nix-darwin-config/";
        ll = "ls -la";
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

  programs.wezterm = {
    enable = true;
    # do not install since it's installed by homebrew
    package = pkgs.emptyDirectory; 
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
  };
}