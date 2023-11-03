local wezterm = require 'wezterm'
local config = {}
config.font = wezterm.font_with_fallback({
    'JetBrains Mono NL',
    'nonicons',
})

config.font_size = 12
--config.freetype_load_target = 'HorizontalLcd'
config.window_background_opacity = 0.85
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_tab_bar = false
config.keys = {
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(1)
  },
}

local colors = {
  foreground = '#f2f2f2',
  background = '#000000',
  selection_fg = '#1d1f21',
  selection_bg = '#73c48f',
  scrollbar_thumb = '#222222',
  split = '#444444',
  ansi = {
    '#333333',
    '#cc0403',
    '#4e9a06',
    '#c4a000',
    '#3465a4',
    '#c678dd',
    '#06898a',
    '#d3d7cf',
  },
  brights = {
    '#88807c',
    '#f15d22',
    '#73c48f',
    '#ffce51',
    '#48b9c7',
    '#cb1ed1',
    '#34e2e2',
    '#eeeeee',
  },
}
config.colors = colors
config.bold_brightens_ansi_colors = false

-- Still cant get this to work the way I want
--config.xcursor_theme = 'Adwaita'

return config

