# home.nix
{
  config,
  pkgs,
  ...
}: {
  home.file = {
    "/.config/wezterm/wezterm.lua".source = wezterm/.wezterm.lua;
  };

  imports = [
    ./common.nix
  ];
}
