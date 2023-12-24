return {
	"ThePrimeagen/harpoon",
	lazy = true,
	keys = function()
		local mark = require "harpoon.mark"
		local ui = require "harpoon.ui"
		return {
			{ "<leader>a", mark.add_file },
			{ "<C-e>", ui.toggle_quick_menu },
			{ "<C-j>", function() ui.nav_next() end },
			{ "<C-k>", function() ui.nav_prev() end },
			{ "<leader>1", function() ui.nav_file(1) end },
			{ "<leader>2", function() ui.nav_file(2) end },
			{ "<leader>3", function() ui.nav_file(3) end },
			{ "<leader>4", function() ui.nav_file(4) end },
			{ "<leader>5", function() ui.nav_file(5) end },
		}
	end,
}

