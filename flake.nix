{
  description = "Slijeff's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, ... }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = with pkgs;
          [
            
          ];
        fonts.packages = with pkgs;
          [
            intel-one-mono
          ];

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        nix.package = pkgs.nix;

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true; # default shell on catalina
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

        # Allow fingerprint for password
        security.pam.enableSudoTouchIdAuth = true;

        users.users.slijeff.home = "/Users/slijeff";

        system.defaults = {
          dock.autohide = true;
          dock.mru-spaces = false;
          finder.AppleShowAllExtensions = true;
          finder.AppleShowAllFiles = true;
          finder.ShowPathbar = true;
          finder.FXPreferredViewStyle = "clmv";
          finder._FXShowPosixPathInTitle = true;
          loginwindow.LoginwindowText = "Welcome Back";
          screensaver.askForPasswordDelay = 10;
        };

        homebrew = {
          enable = true;
          brews = [
            "libomp"
          ];
          casks = [
            "mac-mouse-fix"
            "steam"
            "wechat"
            "notion"
            "wezterm"
            "google-chrome"
            "jordanbaird-ice"
            "itsycal"
            "stats"
            "orbstack"
            "maccy"
            "visual-studio-code"
            "zoom"
            "slack"
          ];
          masApps = {
            xnip = 1221250572;
          };
          onActivation = {
            autoUpdate = true;
            upgrade = true;
            cleanup = "zap";
          };
        };

        nix = {
          settings = {
            auto-optimise-store = true;
            experimental-features = "nix-command flakes";
          };
          gc = {
            automatic = true;
            options = "--delete-older-than 7d";
          };
        };
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."Andromeda" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              # enableRosetta = true;

              # User owning the Homebrew prefix
              user = "slijeff";

              # Automatically migrate existing Homebrew installations
              # autoMigrate = true;

            };
          }
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.slijeff = import ./mac-slijeff.nix;
          }
        ];
      };

      # other linux machine
      homeConfigurations."jhui8" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./vm-jhui8.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Andromeda".pkgs;

      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
    };
}
