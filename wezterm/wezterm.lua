local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- config.font = wezterm.font( 'Berkeley Mono' )

config.font = wezterm.font_with_fallback({
	--'Noto Sans Mono',
	--'Symbols Nerd Font',
	'Berkeley Mono',
	-- 'JetBrains Mono',
	-- 'Segoe UI Emoji',
	'nonicons',
	-- 'Symbols Nerd Font Mono',
	-- 'BlexMono Nerd Font',
})
-- config.line_height = 1.1
config.font_size = 12
config.freetype_load_target = 'HorizontalLcd'
-- config.freetype_load_flags = 'NO_HINTING'
-- config.front_end = "WebGpu"
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
		key = "n",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "n",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "p",
		mods = "SUPER|SHIFT",
		action = wezterm.action.ActivateCommandPalette
	},
	{
		key = "=",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment
	},
	{
		key = "-",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment
	}


	--[[
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
	--]]
}

--config.colors = {}
--config.colors.background = "#151515"

---[[
config.colors = {
	foreground = '#f2f2f2',
	--background = '#000000',
	background = '#151515',
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
--]]
config.bold_brightens_ansi_colors = false

return config
