return {
	{
		"rcarriga/nvim-notify",
		priority = 50,
		dependencies = { { "yamatsum/nvim-nonicons" } },
		config = function()
			require("notify").setup({
				fps = 60,
				stages = "static",
				timeout = 3000,
				icons = require "nvim-nonicons.extentions.nvim-notify",
				background_colour = "#000000",
			})

			vim.notify = require "notify"
		end
	},
}
