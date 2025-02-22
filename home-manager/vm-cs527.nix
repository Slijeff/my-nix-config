{
  config,
  pkgs,
  ...
}: {
  home.username = "jhui8";
  home.homeDirectory = "/home/jhui8";

  imports = [
    ./common.nix
  ];
}
