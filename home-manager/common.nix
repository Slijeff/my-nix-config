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
    zulu8
    btop
    fastfetch
    lazygit
    wget
    nodejs_22
    nodejs_22.pkgs.pnpm
    devbox
    just
    gdu
    git
    ripgrep
  ];

  home.file = { };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "/opt/homebrew/sbin/"
    "/opt/homebrew/bin/"
    "/Users/slijeff/.local/bin/"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      switch = "darwin-rebuild switch --flake ~/nix-config/";
      ft = "docker compose run --rm freqtrade";
      ee = "eza";
      cat = "bat";
    };
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    oh-my-zsh = {
      enable = true;
      theme = "fino-time";
    };
    initContent = ''
      eval $(just --completions zsh)
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [ ];
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
    theme = {
      flavor = {
        light = "catppuccin-latte";
        dark = "catppuccin-mocha";
      };
    };

    settings = {
      manager = {
        ratio = [
          2
          4
          3
        ];
        show_hidden = true;
        sort_dir_first = true;
        linemode = "size";
      };
      preview = {
        ueberzug_scale = 1.5;
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.helix = {
    enable = true;
    themes = {
      catppuccin_frappe_trans = {
        inherits = "catppuccin_frappe";
        "ui.background" = { };
      };
    };
    settings = {
      theme = "catppuccin_frappe_trans";
      editor = {
        true-color = true;
        bufferline = "always";
        cursorline = true;
        lsp = {
          display-messages = true;
        };
      };
      keys = {
        normal = {
          space.g = [
            ":write-all"
            ":new"
            ":insert-output lazygit"
            ":set mouse false" # First disable mouse to hint helix into activating it
            ":set mouse true"
            ":buffer-close!"
            ":redraw"
            ":reload-all"
          ];
          esc = [
            "collapse_selection"
            "keep_primary_selection"
          ];
        };
      };
    };
    languages = {
      language-server = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
        };
        typescript-language-server = with pkgs.nodePackages; {
          command = "${typescript-language-server}/bin/typescript-language-server";
          args = [
            "--stdio"
          ];
        };
        marksman = {
          command = "${pkgs.marksman}/bin/marksman";
          args = [ "server" ];
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }
        {
          name = "typescript";
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "markdown";
          language-servers = [ "marksman" ];
        }
      ];
    };
  };
}
