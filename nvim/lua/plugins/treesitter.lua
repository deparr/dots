return {
	{
		"nvim-treesitter/nvim-treesitter",
		--build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function() 
			require("nvim-treesitter.configs").setup {
				ensure_installed = {
					"vimdoc",
					"lua",
					"go",
					"rust",
					"typescript",
					"javascript"
				},
				highlight = {
					enable = true
				}
			}
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
	},
	--[[
	{
		"nvim-treesitter/playground",
	},
	--]]
}
