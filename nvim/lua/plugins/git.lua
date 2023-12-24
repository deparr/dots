return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPre" },
		config = function()
			require("gitsigns").setup()
		end,
		keys = {
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
			{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>" },
		},
	},
	{
		"tpope/vim-fugitive",
		lazy = true,
		keys = {
			{ "<leader>gs", "<cmd>vertical Git<cr>" }
		}
	},
}

