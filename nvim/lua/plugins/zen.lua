return {
	{
		"folke/zen-mode.nvim",
		lazy = true,
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = true,
				tmux = true,
			},
			window = {
				width = 90,
				options = {
					number = true,
					relativenumber = true,
				}
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
}

