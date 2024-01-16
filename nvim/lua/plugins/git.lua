return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
			vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>")
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>vertical Git<cr>")
		end,
	},
}

