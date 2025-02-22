# home.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
  ];
  home.file = {
    "/.config/wezterm/wezterm.lua".source = wezterm/.wezterm.lua;
    "/.config/aerospace/aerospace.toml".source = aerospace/aerospace.toml;
  };
}
