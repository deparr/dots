return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VeryLazy" },
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = {
					"vimdoc",
					"lua",
					"vim",
					"c",
					"go",
					"rust",
					"typescript",
					"javascript"
				},
				highlight = {
					enable = true
				}
			}
			if require("config.settings").is_windows then
				require 'nvim-treesitter.install'.compilers = { "zig", "gcc" }
			end
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "VeryLazy" },
	},
}

