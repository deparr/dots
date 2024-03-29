return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependecies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require "harpoon"
		harpoon:setup {
			settings = {
				save_on_toggle = true,
			}
		}

		vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc="harpoonadd"})
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), {
			ui_width_ratio = 0.40,
			title_pos = "center",
			border = "rounded",
		}) end, {desc = "harpoon menu"})

		-- USE HARPOON MORE
		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc ="harpoon prev"})
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end,{ desc ="harpoon next"})
		vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end, { desc = "harpoon prev"})
		vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end, {desc = "harpoon next"})
	end,
}

