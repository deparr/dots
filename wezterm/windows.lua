local wezterm = require 'wezterm'
local config = {}
config.window_decorations = 'RESIZE'
config.font = wezterm.font('JetBrains Mono NL', { weight = 'Medium' })
config.font_size = 10
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.default_prog = { 'pwsh.exe', '-WorkingDirectory', 'C:\\Users\\dmparr22\\code' }
config.window_background_opacity = 0.85
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
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
  foreground = '#c0c0c0',
  background = '#1d1f21',
  cursor_bg = '#e0e0e0',
  cursor_fg = '#1d1f21',
  cursor_border = '#e0e0e0',
  selection_fg = 'none',
  selection_bg = 'rgba(255, 255, 255, 0.3)',
  scrollbar_thumb = '#222222',
  split = '#444444',
  ansi = {
    '#000000',
    '#cc0403',
    '#4e9a06',
    '#c4a000',
    '#0d73cc',
    '#cb1ed1',
    '#06989a',
    '#dddddd',
  },
  brights = {
    '#767676',
    '#f5403f',
    '#23fd00',
    '#fffd00',
    '#1a8fff',
    '#fd28ff',
    '#14ffff',
    '#ffffff',
  },
}
config.colors = colors
config.bold_brightens_ansi_colors = false

return config

