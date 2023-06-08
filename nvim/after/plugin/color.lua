---[[ gruvbox.nvim
require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = false,
	italic = {
        strings = false,
        operators = false,
        comments = false,
    },
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {
        -- base groups
        GruvboxOrange = { fg = '#f28534', bold = false },
        GruvboxOrangeBold = { fg = '#f28534', bold = true },
        GruvboxOrangeUnderline = { sp = '#f28534', undercurl = true },
        -- builtin groups
        String = { fg = "#a9b665", italic = false },
        Pmenu = { link = 'Gruvboxfg2' },
        PmenuSel = { fg = '#f28534', bg = 'none', bold = false },
        --PmenuThumb = { fg = '#00ff00' },
        --PmenuSBar = { fg = '#' },
        StatusLine = { fg = '#a89984', bg = '#282828', reverse = false },
        -- DONT SET NC LINE ADDS CARETS ON FOCUS LOSS
        --StatusLineNC = { fg = 'none', bg = 'none', reverse = false },

        --netrw
        netrwDir = { fg = '#83a598', bg = 'none' },
        netrwClassify = { fg = '#83a598', bg = 'none' },
        netrwSymlink = { fg = '#8ec07c', bg = 'none' },
        netrwExe = { fg = '#b8bb26', bg = 'none' },

        -- treesitter
        ["@punctuation.bracket"] = { link = 'Gruvboxfg3' },
        ["@constructor"] = { link = 'Gruvboxfg2' },
        ["@namespace"] = { link = 'Gruvboxfg2' },
        ["@variable"] = { link = 'Gruvboxfg2' },
        ["@variable.builtin"] = { link = 'GruvboxAqua' },
        ["@tag"] = { link = 'GruvboxYellow' },
        ["@include"] = { link = 'GruvboxRed' },
        ["@function"] = { link = 'GruvboxGreen' },
        ["@label"] = { link = 'GruvboxGreen' },
        ["@conceal"] = { link = 'Gruvboxfg2' },

        -- telescope
        TelescopeNormal = { link = 'Gruvboxfg3' },


        --

    },
	dim_inactive = false,
	transparent_mode = true,
})
--]]

---[[
-- Default options:
require('kanagawa').setup({
    compile = true,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {
            fujiWhite = "#C8C093",
        },
        theme = { wave = {}, lotus = {}, dragon = {},
            all = {
                ui = {
                    bg_gutter = "none"
                }
            },
        },
    },
    overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        return {
            Pmenu = { fg = theme.ui.shade0, bg = "none" },
            PmenuSel = { fg = theme.syn.operator, bg = "none" },
            PmenuSbar = { bg = theme.uibg_m1 },
            PmenuThumb = { bg = "none" },
            --TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            --TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "none" },
            --TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
            --TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
            --TelescopePreviewNormal = { bg = "none" },
            --TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },
        }
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

--[[
require('catppuccin').setup({
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = true,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        telescope = true,
    },
})

require('nightfox').setup({
    options = {
        transparent = true,
        modules = {
            diagnostic = {
                background = false,
            },
            native_lsp = {
                background = false,
            },
        },
    },
    groups = {
        all =  {
            Pmenu = { bg = "none" },
            PmenuSel = { fg = "#c94f6d", bg = "none" },
            PmenuSbar = { bg = "none" },
            PmenuThumb = { bg = "none" },
        }
    }
})
--]]

require("tokyonight").setup({
    style = 'night',
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = {},
        keywords = {},
        functions = {},
        variables = {},
        floats = 'transparent',
    },

    on_highlights = function(hl, c)
        hl.Visual = {
            bg = '#3b4261'
        }

        hl.Include = {
            bg = c.none,
            fg = c.magenta,
        }

        hl.Type = {
            fg = c.green2
        }

        hl['@namespace'] = {
            bg = c.none,
            fg = '#c0caf5',
        }

        hl['@constant.builtin'] = {
            fg = c.yellow,
        }

        hl.TreesitterContext = {
            bg = c.none
        }

        hl.DiagnosticVirtualTextError = {
          bg = c.none,
          fg = "#db4b4b"
        }

        hl.DiagnosticVirtualTextHint = {
          bg = c.none,
          fg = "#1abc9c"
        }

        hl.DiagnosticVirtualTextInfo = {
          bg = c.none,
          fg = "#0db9d7"
        }

        hl.DiagnosticVirtualTextWarn = {
          bg = c.none,
          fg = "#e0af68"
        }
    end
})

require('bamboo').setup({
    style = 'multiplex',
    transparent = true,
    ending_tildes = true,
    cmp_itemkind_reverse = false,

    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none',
    },

    colors = {},
    highlights = {},

    diagnostics = {
        darker = true,
        undercul = true,
        background = false,
    },
})

--[[
require("vscode").setup({
    transparent = true,
    italic_comments = false,
})
require("vscode").load()

require('rose-pine').setup({
    dark_variant = 'main',
    disable_background = true,
    disable_float_background = true,
    disable_italics = true,
})

--]]

function LightItUp(color)
	color = color or 'tokyonight'
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

LightItUp()

