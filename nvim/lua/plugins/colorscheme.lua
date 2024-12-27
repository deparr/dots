return {
  {
    "deparr/tairiki.nvim",
    dev = true,
    priority = 1000,
    config = function()
      local c = require "tairiki.palette"
      local util = require "tairiki.util"
      local dark_cyan = util.darken(c.dark.cyan, 0.9, c.dark.bg)
      local light_yellow = util.lighten(c.dark.yellow, 0.5, c.dark.fg)
      -- local higher_con_comment = util.lighten(c.dark.comment, 0.3, light_yellow)
      require("tairiki").setup {
        style = "dimmed",
        ending_tildes = true,
        term_colors = false,
        diagnostics = {
          --darker = true,
          undercurl = true,
        },
        colors = {
          zero_black = "#000000",
          lua_blue = "#618aae",
        },
        highlights = {
          -- ["NormalFloat"] = { bg = "$zero_black" },
          -- ["FloatTitle"] = { bg = "$zero_black" },
          -- ["FloatBorder"] = { fg = "$zero_black", bg = "$zero_black" },
          -- ["FloatShadow"] = { fg = "$zero_black", bg = "$zero_black" },
          -- ["FloatShadowThrough"] = { fg = "$zero_black", bg = "$zero_black" },
          ["Title"] = { fg = c.dark.fg, fmt = "none" },

          ["@lsp.typemod.operator.controlFlow.rust"] = { link = "Special" },
          ["@lsp.typemod.parameter"] = { fmt = "italic" },
          ["@lsp.type.parameter"] = { fmt = "italic" },

          ["@attribute"] = { fg = "$lua_blue" },
          -- ["@keyword.modifier"] = { fg = c.dark.purple },

          -- lang spef
          ["@string.special.url.gdscript"] = { fg = dark_cyan, fmt = "italic" },

          ["@string.special.url.svelte"] = { fg = "$green" },

          ["@constructor.ocaml"] = { fg = "$orange" },
          ["@module.ocaml"] = { fg = "$orange" },
          ["@label.ocaml"] = { fg = light_yellow },

          ["@operator.gleam"] = { fg = "$light_purple" },

          ["@variable.powershell"] = { fg = "$orange" },
        },
        toggle_style_key = "<leader>cs",
        toggle_style_list = { "dimmed", "dark" },
      }
    end,
  },
  {
    "tjdevries/colorbuddy.nvim",
    config = function()
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = { "gruvbuddy" },
        callback = function()
          local cb = require "colorbuddy"
          local s = cb.styles
          local c = cb.colors
          local g = cb.groups
          local Group = cb.Group

          Group.new("Bold", nil, nil, s.bold)
          Group.new("Conceal", c.gray3, nil, s.italic)
          Group.new("ColorColumn", c.none, c.gray2:dark())
          Group.new("FloatBorder", g.FloatBorder.fg, c.background, s.italic)
          Group.new("MatchParen", c.orange, nil, s.bold)
          Group.new("StatusLine", c.gray6, c.gray2:dark())
          Group.new("TabLineFill", c.background, c.background)
          Group.new("Question", c.gray6)
          Group.new("QuickFixLine", c.gray6, nil, s.bold)
          Group.new("Visual", nil, c.gray3:dark():dark():dark():dark())

          -- Group.new("DiagnosticWarn", c.blue:saturate(0.4):complement())
          local warn = c.orange:saturate(0.2)
          local ok = c.green:dark()
          local info = c.blue:dark()
          local hint = c.purple:light()
          Group.new("ErrorMsg", c.red)
          Group.new("WarningMsg", warn)
          Group.new("ModeMsg", c.gray3)
          Group.new("MoreMsg", info)
          Group.new("DiagnosticWarn", warn)
          Group.new("DiagnosticOk", ok)
          Group.new("DiagnosticInfo", info)
          Group.new("DiagnosticHint", hint)
          Group.new("DiagnosticUnderlineError", nil, nil, s.underline, c.red)
          Group.new("DiagnosticUnderlineOk", nil, nil, s.underline, ok)
          Group.new("DiagnosticUnderlineWarn", nil, nil, s.underline, warn)
          Group.new("DiagnosticUnderlineInfo", nil, nil, s.underline, info)
          Group.new("DiagnosticUnderlineHint", nil, nil, s.underline, hint)

          Group.new("@function.lua", c.blue:dark())
          Group.new("@function.method.lua", c.blue:dark())
          Group.new("@function.method.call.lua", c.blue:dark())
          Group.new("@property.lua", c.superwhite)

          Group.new("@string.special.url.gdscript", c.white)
          Group.new("@function.call.gdscript", c.blue:dark())
          Group.new("@function.gdscript", c.blue:dark())

          Group.new("TreesitterContextLineNumber", c.gray3, g.NormalFloat)
          -- Group.new("TreesitterContextLineNumberBottom", nil, nil, s.underline, c.gray3)
          -- Group.new("TreesitterContextBottom", nil, nil, s.underline, c.gray3)
          Group.new("LazyButtonActive", c.background, c.superwhite)
          Group.new("TelescopeBorder", g.FloatBorder.fg, c.background)
        end,
      })
    end,
  },
  {
    "ferdinandrau/lavish.nvim",
    opts = {
      palette_overrides = {
        dark = {
          base = {
            black = "#000000",
          },
          normal = {
            orange = "#e78c45",
          },
          bold = {
            orange = "#de935f",
          },
        },
      },
      scheme_overrides = function(c, s)
        return {
          Bold = { bold = true },
          Character = { fg = c.normal.red },
          Constant = { fg = c.normal.orange, bold = false },
          Number = { fg = c.normal.orange },
          SpecialChar = { fg = c.normal.red },

          DiagnosticOk = { fg = c.bold.green },
          DiagnosticUnderlineOk = { sp = c.bold.green, underline = true },
          DiagnosticUnderlineInfo = { sp = c.bold.blue, underline = true },
          DiagnosticUnderlineHint = { sp = c.bold.green, underline = true },
          DiagnosticUnderlineWarn = { sp = c.bold.yellow, underline = true },
          DiagnosticUnderlineError = { sp = c.normal.red, underline = true },
          LspSignatureActiveParameter = { bold = true, underline = true },

          NormalFloat = { bg = c.base.bg3 },
          FloatBorder = { bg = c.base.bg3, fg = c.base.fg3 },
          StatusLine = { bg = c.base.bg3 },
          TabLineSel = { bg = c.base.bg1, bold = true },
          TermCursor = { link = nil },
          TermCursorNC = { fg = nil, bg = nil },
          Cursor = { fg = nil, bg = nil },

          TelescopeNormal = { bg = c.base.bg1, fg = c.base.fg1 },
          TelescopeBorder = { bg = c.base.bg1, fg = c.base.fg1 },

          ["@character"] = { link = "Character" },
          ["@module"] = { fg = c.base.fg2 },
          ["@tag"] = { fg = c.bold.red },
          ["@tag.delimiter"] = { fg = c.base.fg3 },
          ["@variable"] = { link = "" },
          ["@variable.member"] = { fg = c.base.fg2 },
          ["@property"] = { fg = c.base.fg2 },
        }
      end,
    },
  },
  {
    "ramojus/mellifluous.nvim",
    opts = {
      colorset = "kanagawa_dragon",
      plugins = {
        telescope = {
          nvchad_like = false,
        },
        startify = false,
        neo_tree = {
          enabled = false,
        },
        nvim_tree = {
          enabled = false,
        },
        indent_blankline = false,
        aerial = false,
        mason = false,
        nvim_notify = false,
        neotest = false,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        hl.WinSeparator = { fg = c.fg_gutter }

        hl.helpCommand = { fg = c.blue, bg = nil }

        hl["@markup.raw.markdown_inline"] = { fg = c.blue, bg = nil }
        hl["@string.special.url.gdscript"] = { fg = c.teal }
      end,
    },
  },
  { "erikbackman/brightburn.vim" },
  { "miikanissi/modus-themes.nvim" },
  { "yorickpeterse/nvim-grey" },
  { "yorik1984/newpaper.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "savq/melange-nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
    },
  },
  -- {
  --   "wincent/base16-nvim",
  --   -- priority = 1000,
  --   config = function()
  --     local overwrite_gruv = function()
  --       local hl = function(group, opts)
  --         vim.api.nvim_set_hl(0, group, opts)
  --       end
  --       hl("Underline", { underline = true })
  --       hl("Special", { fg = "#fb4934" })
  --       hl("Title", { fg = "#ebdbb2" })
  --       hl("Conceal", { fg = "#83a598" })
  --       hl("Label", { fg = "#fabd2f", bold = true })
  --       local over = vim.api.nvim_get_hl(0, { name = "Boolean" })
  --       hl("Comment", over)
  --       hl("@variable", { fg = "#d5c4a1" })
  --       hl("@property", { fg = "#d5c4a1" })
  --       hl("TreesitterContextLineNumber", { fg = "#665c54", bg = "#000000" })
  --       hl("TabLine", { fg = "#665c54", bg = "#282828" })
  --       hl("TabLineFill", { bg = "#282828" })
  --       hl("TabLineSel", { fg = "#b8bb26", bg = "#282828" })
  --       hl("ColorColumn", { bg = "#282828" })
  --       hl("WinSeparator", { fg = "#504945" })
  --       hl("StatusLine", { fg = "#bdae93", bg = "#282828" })
  --
  --       for _, diff in ipairs {
  --         "DiffAdd",
  --         "DiffChange",
  --         "DiffDelete",
  --         "DiffText",
  --         "GitGutterAdd",
  --         "GitGutterChange",
  --         "GitGutterDelete",
  --         "SignColumn",
  --         "LineNr",
  --       } do
  --         over = vim.api.nvim_get_hl(0, { name = diff })
  --         over.bg = "#1d2021"
  --         hl(diff, over)
  --       end
  --
  --       -- hl('LspDiagnosticsDefaultError', {})
  --       -- hl('LspDiagnosticsDefaultWarning', {})
  --       -- hl('LspDiagnosticsDefaultHnformation', {})
  --       -- hl('LspDiagnosticsDefaultHint', {})
  --
  --       hl("Tag", { fg = "#d79921" })
  --       hl("@tag.delimiter", { link = "Delimiter" })
  --       hl("@tag.attribute", { link = "Function" })
  --       hl("@constructor", { fg = "#d79921" })
  --       hl("@tag.builtin", { fg = "#fabd2f" })
  --
  --       hl("@builtin", { fg = "#d65d0e" })
  --       hl("@constant.builtin", { fg = "#fe8019" })
  --       hl("@module.builtin", { link = "@builtin" })
  --       hl("@type.builtin", { fg = "#d79921" })
  --       hl("@attribute.builtin", { link = "@builtin" })
  --
  --       hl("@string.special.url", {})
  --       hl("@markup.link", {})
  --       hl("@markup.link.markdown_inline", { fg = "#83a598" })
  --       hl("@markup.link.vimdoc", { fg = "#fabd2f" })
  --       hl("@markup.link.label.markdown_inline", {})
  --       hl("@markup.raw.block.markdown", { fg = "#d65d0e" })
  --       hl("@label.markdown", { fg = "#fe8019" })
  --       hl("@markup", { fg = "#8ec07c" })
  --       hl("@markup.math", { fg = "#83a598" })
  --       hl("@markup.quote", { fg = "#d5c4a1" })
  --       hl("@markup.list", { fg = "#fb4934" })
  --       hl("@markup.list.checked", { fg = "#a89984" })
  --
  --       hl("Added", { fg = "#b8bb26" })
  --       hl("Removed", { fg = "#fb4934" })
  --       hl("Changed", { fg = "#83a598" })
  --
  --       hl("DiagnosticOk", { fg = "#b8bb26" })
  --       hl("DiagnosticInfo", { fg = "#928374" })
  --       hl("DiagnosticHint", { fg = "#a89984" })
  --       hl("DiagnosticWarn", { fg = "#fabd2f" })
  --       hl("DiagnosticError", { fg = "#fb4934" })
  --       hl("DiagnosticUnnecessary", { link = "Comment" })
  --
  --       hl("WarningMsg", { fg = "#d79921" })
  --
  --       hl("TelescopeTitle", { fg = "#fe8019" })
  --       hl("TelescopeSelection", { bg = "#282828" })
  --       hl("TelescopeSelectionCaret", { fg = "#d65d0e", bg = "#282828" })
  --       hl("TelescopeBorder", { fg = "#928374" })
  --
  --       hl("fugitiveUntrackedModifier", { link = "Statement" })
  --       hl("fugitiveUnstagedModifier", { link = "Statement" })
  --       hl("fugitiveUntrackedModifer", { link = "Statement" })
  --       hl("fugitiveUntrackedModifer", { link = "Statement" })
  --
  --       hl("GitGraphHash", { link = "Identifier" })
  --       hl("GitGraphTimestamp", { link = "SpecialChar" })
  --       hl("GitGraphBranchMsg", {})
  --       hl("GitGraphAuthor", { link = "String" })
  --       hl("GitGraphBranchName", { link = "gitCommitBranch" })
  --     end
  --
  --     vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  --       pattern = { "base16-gruvbox-dark-hard" },
  --       callback = overwrite_gruv,
  --     })
  --   end,
  -- },
  {
    "ribru17/bamboo.nvim",
    config = function()
      require("bamboo").setup {
        style = "multiplex",
        ending_tidles = true,
        diagnostics = {
          undercurl = false,
        },
        highlights = {
          -- StatusLine = { bg = "#202020" },
          -- Normal = { bg = "#151515" },
          NormalFloat = { bg = "#000000" },
          -- Float = { bg = "#000000" },
          -- NormalNC = { bg = "#151515" },
          ["@type.builtin"] = { fg = "$coral" },
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
        },
      }
    end,
  },
}
