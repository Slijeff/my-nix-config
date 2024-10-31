{
  config,
  pkgs,
  ...
}: {
  home.username = "slijeff";
  home.homeDirectory = "/home/slijeff";

  imports = [
    ./common.nix
  ];
}