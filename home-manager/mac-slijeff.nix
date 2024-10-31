# home.nix
{
  config,
  pkgs,
  nixvim,
  ...
}: {
  imports = [
    ./nixvim/nixvim.nix
    ./common.nix
  ];
  home.file = {
    "/.config/wezterm/wezterm.lua".source = wezterm/.wezterm.lua;
  };
}
