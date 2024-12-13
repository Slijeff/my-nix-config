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
      "input-source-pro"
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
