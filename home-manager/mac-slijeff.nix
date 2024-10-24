# home.nix

{ config, pkgs, ... }:

{

  home.file = {
    ".wezterm.lua".source = wezterm/.wezterm.lua;
  };

  imports = [
    ./common.nix
  ];

}
