{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./common.nix
  ];

  homebrew = {
    brews = [
      "asitop"
      "yt-dlp"
      "ffmpeg"
      "gromgit/fuse/ntfs-3g-mac"
    ];
    casks = [
      # "logi-options+"
      # "ntfstool"
      "macfuse"
      "mounty"
      "pearcleaner"
      "parsec"
      "steam"
      "wechat"
      "notion"
      "ente-auth"
      "zed@preview"
    ];
    masApps = {
      oneDrive = 823766827;
    };
  };
}
