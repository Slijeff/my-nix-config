{
  config,
  pkgs,
  ...
}: {
  home.username = "jhui8";
  home.homeDirectory = "/home/jhui8";

  imports = [
    ./nixvim/nixvim.nix
    ./common.nix
  ];
}
