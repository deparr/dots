local settings = require "config.settings"
-- TODO: use lazy.enable or whatever for this
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
