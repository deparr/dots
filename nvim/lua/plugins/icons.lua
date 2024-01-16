local settings = require "config.settings"
if not settings.use_icons then
	return {}
end

return {
	{
		"kyazdani42/nvim-web-devicons",
		lazy = true,
		opts = {
			override_by_extension = {
				["toml"] = {
					icon = ""
				}
			}
		},
	},
	{
		"yamatsum/nvim-nonicons",
		lazy = true,
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		}
	},
}
