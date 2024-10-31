{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nixvim/nixvim.nix
    ./common.nix
  ];

  home.username = "slijeff";
  home.homeDirectory = "/home/slijeff";
}
