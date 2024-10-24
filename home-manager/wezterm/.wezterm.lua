-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"
config.font_size = 16

-- Tab bar and window
config.tab_max_width = 20
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.macos_window_background_blur = 10

config.audible_bell = "Disabled"
return config
