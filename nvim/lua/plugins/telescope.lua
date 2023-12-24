return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = { "Telescope" },
		version = "0.1.*",
		config = function()
			local ts = require "telescope"
			local icons = require "nvim-nonicons"
			ts.setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
				defaults = {
					--prompt_prefix = "  " .. icons.get("telescope") .. "  ",
					selection_caret = "❯ ",
					--entry_prefix = "   ",
				}
			})
			ts.load_extension("fzf")
		end,
		keys = function()
			local builtin = require "telescope.builtin"
			return {
				{ "<leader>ff", builtin.find_files },
				{ "<leader>fg", builtin.git_files },
				{ "<leader>fl", builtin.live_grep },
				{ "<leader>fd", builtin.diagnostics },
				{ "<leader>fh", builtin.help_tags },
				{ "<leader>fk", builtin.keymaps },
				{ "<leader>fs", function()
					builtin.grep_string({ search = vim.fn.input("grep > ") })
				end},
			}
		end
	}
}
