{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  homebrew = {
    casks = [
      "steam"
      "wechat"
      "notion"
    ];
  };
}
