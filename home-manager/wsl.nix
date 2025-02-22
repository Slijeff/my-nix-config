{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  home.username = "slijeff";
  home.homeDirectory = "/home/slijeff";
}
