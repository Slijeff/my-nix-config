# common config for all Macs
{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
  ];
  fonts.packages = with pkgs; [
    intel-one-mono
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Allow fingerprint for password
  security.pam.enableSudoTouchIdAuth = true;

  users.users.slijeff.home = "/Users/slijeff";

  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    dock.expose-group-apps = true;
    finder.AppleShowAllExtensions = true;
    finder.AppleShowAllFiles = true;
    finder.ShowPathbar = true;
    finder.FXPreferredViewStyle = "clmv";
    finder._FXShowPosixPathInTitle = true;
    loginwindow.LoginwindowText = "Welcome Back";
    screensaver.askForPasswordDelay = 10;
    spaces.spans-displays = false;
  };

  homebrew = {
    enable = true;
    brews = [
      "libomp"
    ];
    casks = [
      "mos"
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
      "aerospace"
      "betterdisplay"
    ];
    taps = [
      "nikitabobko/homebrew-tap"
    ];
    masApps = {
      xnip = 1221250572;
      bitwarden = 1352778147;
    };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };

  nix = {
    settings = {
      # auto-optimise-store = true;
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };
  };
}
