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

		vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), {
			ui_width_ratio = 0.40,
			title_pos = "center",
			border = "rounded",
		}) end)

		-- USE HARPOON MORE
		--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
		vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)
	end,
}

