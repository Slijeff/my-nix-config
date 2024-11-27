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
    ];
    casks = [
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
