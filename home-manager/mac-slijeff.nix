# home.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nixvim/nixvim.nix
    ./common.nix
  ];
  home.file = {
    "/.config/wezterm/wezterm.lua".source = wezterm/.wezterm.lua;
    # "/.config/aerospace/aerospace.toml".source = aerospace/aerospace.toml;
    "/.config/aerospace/aerospace.toml".source = aerospace/default-config.toml;
  };
}
