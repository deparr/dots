-- highlight-groups group-name -> syntax.txt
return {
  {
    "deparr/tairiki.nvim",
    -- dir = require("util").dev("deparr/tairiki.nvim"),
    priority = 1000,
    branch = "v2",
    opts = {
      palette = "gruvbuddy",
      default_dark = "gruvbuddy",
      transparent = false,
      terminal = false,
      end_of_buffer = false,
      diagnostics = {
        darker = true,
        background = true,
        undercurl = true,
      },
      plugins = {
        auto = true,
      },
      colors = function(c, _)
        local util = require "tairiki.util"
        -- c.bg = "#101010"
        c.luablue = "#618aae"
        c.dark_cyan = util.blend_bg(c.cyan, 0.9, c.bg)
        -- this is gonna look terrible with light
        c.light_yellow = util.blend_fg(c.yellow, 0.5, c.fg)
        -- c.dark_cyan = util.saturate(c.cyan, 0.2)
      end,

      highlights = function(hl, c, _)
        hl["Title"] = { fg = c.fg, bold = false }
        hl["Special"] = { fg = c.syn.special, bold = false }

        -- lang spef
        hl["@string.special.url.gdscript"] = { fg = c.dark_cyan, italic = true }
        -- hl["@attribute.gdscript"] = { fg = c.luablue }

        hl["@string.special.url.gomod"] = { fg = c.dark_cyan, underline = false }
        hl["@string.special.url.gosum"] = { fg = c.dark_cyan, underline = false }

        hl["@string.special.url.svelte"] = { fg = c.syn.string }

        hl["@constructor.ocaml"] = { fg = c.orange }
        -- hl["@module.ocaml"] = { fg = c.orange }
        -- hl["@label.ocaml"] = { fg = c.yellow }

        hl["@operator.gleam"] = { fg = c.light_purple and c.light_purple or c.purple }

        hl["@variable.powershell"] = { fg = c.syn.constant }
      end,
    },
  },
  { "sainnhe/sonokai" },
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
          Group.new("FloatBorder", c.superwhite, c.none)
          Group.link("Whitespace", g.NonText)
          -- vim.api.nvim_set_hl(0, "Whitespace", { link = "NonText" })

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
          Group.new("@function.builtin.lua", c.blue:dark())
          Group.new("@function.method.lua", c.blue:dark())
          Group.new("@function.method.call.lua", c.blue:dark())
          Group.new("@property.lua", c.superwhite)
          Group.new("@constructor.lua", c.superwhte)

          Group.new("@string.special.url.gdscript", c.cyan)
          Group.new("@function.gdscript", c.blue:dark())
          Group.new("@function.call.gdscript", c.blue:dark())
          Group.new("@function.method.gdscript", c.blue:dark())
          Group.new("@function.method.call.gdscript", c.blue:dark())
          Group.new("@function.builtin", c.blue:dark())
          Group.new("@property.gdscript", c.superwhite)

          Group.new("@function.gdshader", c.blue:dark())
          Group.new("@function.glsl", c.blue:dark())

          Group.new("LazyButtonActive", c.background, c.superwhite)
          Group.new("TelescopeBorder", g.FloatBorder.fg, c.background)
        end,
      })
    end,
  },
  { "ferdinandrau/carbide.nvim" },
  {
    "ribru17/bamboo.nvim",
    config = function()
      require("bamboo").setup {
        style = "vulgaris",
        ending_tidles = true,
        diagnostics = {
          undercurl = true,
        },
        highlights = {
          -- StatusLine = { bg = "#202020" },
          -- Normal = { bg = "#151515" },
          -- NormalFloat = { bg = "#000000" },
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
