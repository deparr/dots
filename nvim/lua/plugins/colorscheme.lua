return {
	{
		dir = "~/dev/tairiki.nvim",
		priority = 1000,
		opts = function()
			return {
				style = "dark",
				transparent = false,
				ending_tiles = true,
				term_colors = false,
				diagnostics = {
					--darker = true,
					undercurl = false,
				},
				highlights = {
					NotifyBackground = { bg = "#000000" },
					["@lsp.typemod.operator.controlFlow.rust"] = { link = "Special" },
				}

			}
		end,
	},
	{
		"folke/tokyonight.nvim",
		opts = function()
			return {
				style = "night",
				terminal_colors = true,
				transparent = false,
			}
		end,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	--{ "shaunsingh/oxocarbon.nvim" }
	{ dir = "~/dev/oxocarbon.nvim" },
	{
		"ribru17/bamboo.nvim",
		config = function()
			require("bamboo").setup {
				ending_tiles = true,
				diagnostics = {
					undercurl = false
				}
			}
			require("bamboo").load()
		end
	}
}
