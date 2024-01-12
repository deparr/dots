return { 
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = function()
			vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
		end,
	}
}

