return {
	{
		dir = "~/dev/tairiki.nvim",
		priority = 1000,
		config = function()
			require("tairiki").setup {
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
		"deparr/slim",
		dev = true,
		config = function()
			require("slim").setup {
				colors = {
					tairiki_gray = "#a89984",
				},
				highlights = {
					["DiffChange"] = { fg = "$blue" },
					["DiffText"] = { fg = "$tairiki_gray" },
					["FloatBorder"] = { fg = "$bg_dark", bg = "$bg_dark" },
					["StatusLine"] = { fg = "$white_light", bg = "$bg_light"  },
					["SpecialChar"] = { fg = "$orange" },
					["LspInfoBorder"] = { fg = "$bg_dark", bg = "$bg_dark" },

					["netrwPlain"] = { fg = "$white" },
					["netrwDir"] = { fg = "$blue_dark" },
					["netrwClassify"] = { fg = "$yellow_light" },
					["netrwSymLink"] = { fg = "$cyan" },
					["netrwLink"] = { fg = "$cyan" },
					["netrwExe"] = { fg = "$aqua" },

					["fugitiveHeader"] = { link = "Macro" },
					["fugitiveHelpHeader"] = { fg = "$gray_light" },
					["fugitiveHelpTag"] = { link = "fugitiveHelpHeader" },
					["fugitiveHunk"] = { fg = "$tairiki_gray" },
					["fugitiveSymbolicRef"] = { link = "Identifier" },
					["fugitiveStagedHeading"] = { link = "Macro" },
					["fugitiveStagedModifier"] = { link = "Structure" },
					["diffLine"] = { fg = "$yellow_light" },
					["diffSubname"] = { fg = "$blue_dark" },

					["@constant.builtin"] = { fg = "$orange" },
					["@function.call.rust"] = { fg = "$blue_dark" }, -- not srue about this
					["@lsp.type.decorator"] = { link = "Macro" },
				}
			}
		end
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
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup {
				styles = {
					italic = false,
					bold = true,
				}
			}
		end
	},
	{ "shaunsingh/oxocarbon.nvim" },
	{
		"blazkowolf/gruber-darker.nvim",
		config = function()
			require("gruber-darker").setup {
				bold = true,
				invert = {
					signs = false,
					tabline = false,
					visual = false,
				},
				italic = {
					strings = false,
					comments = false,
					operators = false,
					folds = true,
				},
				undercurl = false,
				underline = true,
			}
		end
	},
	{
		"ribru17/bamboo.nvim",
		config = function()
			require("bamboo").setup {
				style = "multiplex",
				ending_tidles = true,
				diagnostics = {
					undercurl = false
				},
				highlights = {
					StatusLine = { bg = "#202020" },
					["@type.builtin"] = { fg = "$coral" },
				},
				colors = {
					bg0 = "#151515"
				},
				code_style = {
					comments = "none",
					conditionals = "none",
					keywords = "none",
					functions = "none",
					namespaces = "none",
					parameters = "none",
					strings = "none",
					variables = "none",
				}
			}
		end
	}
}
