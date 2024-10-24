# home.nix

{ config, pkgs, ... }:

{

  home.file = {
    ".wezterm.lua" = wezterm/.wezterm.lua;
  };

  imports = [
    ./common.nix
  ];

}
