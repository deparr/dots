return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame")
			vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis")
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>vertical Git<cr>")
		end,
	},
}

