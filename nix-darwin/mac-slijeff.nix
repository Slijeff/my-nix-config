{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  homebrew = {
    brews = [
      "asitop"
      "yt-dlp"
      "ffmpeg"
    ];
    casks = [
      # "logi-options+"
      "pearcleaner"
      "parsec"
      "steam"
      "wechat"
      "notion"
      "ente-auth"
    ];
    masApps = {
      oneDrive = 823766827;
    };
  };
}
