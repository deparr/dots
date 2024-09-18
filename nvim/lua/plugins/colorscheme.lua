return {
  {
    "deparr/tairiki.nvim",
    dev = false,
    branch = "minimal",
    -- priority = 1000,
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
        colors = {
          zero_black = "#000000",
          lua_blue = "#618aae",
          seagreen = "#99cc99",
        },
        highlights = {
          -- ["NotifyBackground"] = { bg = "$zero_black" },
          -- ["NormalFloat"] = { bg = "$zero_black" },
          ["CursorLineNr"] = { fg = "$fg", bold = true },
          ["CursorLine"] = { bg = "$bg0" },
          -- ["FloatTitle"] = { bg = "$zero_black" },
          -- ["FloatBorder"] = { fg = "$zero_black", bg = "$zero_black" },
          -- ["FloatShadow"] = { fg = "$zero_black", bg = "$zero_black" },
          -- ["FloatShadowThrough"] = { fg = "$zero_black", bg = "$zero_black" },
          -- ["LspInfoBorder"] = { link = "FloatBorder" },
          -- ["LspInfoFloat"] = { link = "NormalFloat" },
          --
          ["@lsp.typemod.operator.controlFlow.rust"] = { link = "Special" },
          ["@lsp.typemod.parameter"] = { fmt = "italic" },
          ["@lsp.type.parameter"] = { fmt = "italic" },
          -- -- ["@field"] = { link = "Normal" }, -- TODO: play with these a little more
          -- -- ["@operator"] = { fg = "$purple" },

          ["TreesitterContext"] = { bg = "$bg1" },
          ["TreesitterContextLineNumber"] = { fg = "$blue", bg = "$bg1" },

          ["@string.special.url.gdscript"] = { fg = "$seagreen" },
          ["@operator.gleam"] = { fg = "$light_purple" },
          -- ["@function.lua"] = { fg = "$lua_blue" },
          -- ["@function.builtin.lua"] = { fg = "$lua_blue" },
        },
        toggle_style_key = "<leader>cs",
        toggle_style_list = { "dark", "light" },
      }
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

          NormalFloat = { bg = c.base.bg3 },
          FloatBorder = { bg = c.base.bg3, fg = c.base.fg3 },
          StatusLine = { bg = c.base.bg3 },
          TabLineSel = { bg = c.base.bg1, bold = true },

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
  { "tjdevries/colorbuddy.nvim" },
  { "yorickpeterse/nvim-grey" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "savq/melange-nvim" },
  { "eemed/sitruuna.vim" },
  -- { "morhetz/gruvbox" },
  { "wuelnerdotexe/vim-enfocado" },
  { "EdenEast/nightfox.nvim" },
  {
    "wincent/base16-nvim",
    priority = 1000,
    config = function()
      local overwrite_gruv = function()
        local hl = function(group, opts)
          vim.api.nvim_set_hl(0, group, opts)
        end
        hl("Underline", { underline = true })
        hl("Special", { fg = "#fb4934" })
        hl("Title", { fg = "#ebdbb2" })
        hl("Conceal", { fg = "#83a598" })
        local over = vim.api.nvim_get_hl(0, { name = "Boolean" })
        hl("Comment", over)
        hl("@variable", { fg = "#d5c4a1" })
        hl("@property", { fg = "#d5c4a1" })
        hl("TreesitterContextLineNumber", { fg = "#665c54", bg = "#000000" })
        hl("TabLine", { fg = "#665c54", bg = "#282828" })
        hl("TabLineFill", { bg = "#282828" })
        hl("TabLineSel", { fg = "#b8bb26", bg = "#282828" })
        hl("ColorColumn", { bg = "#282828" })
        hl("WinSeparator", { fg = "#504945" })
        hl("StatusLine", { fg = "#bdae93", bg = "#282828" })

        for _, diff in ipairs {
          "DiffAdd",
          "DiffChange",
          "DiffDelete",
          "DiffText",
          "GitGutterAdd",
          "GitGutterChange",
          "GitGutterDelete",
          "SignColumn",
          "LineNr",
        } do
          over = vim.api.nvim_get_hl(0, { name = diff })
          over.bg = "#1d2021"
          hl(diff, over)
        end

        -- hl('LspDiagnosticsDefaultError', {})
        -- hl('LspDiagnosticsDefaultWarning', {})
        -- hl('LspDiagnosticsDefaultHnformation', {})
        -- hl('LspDiagnosticsDefaultHint', {})

        hl("Tag", { fg = "#d79921" })
        hl("@tag.delimiter", { link = "Delimiter" })
        hl("@tag.attribute", { link = "Function" })
        hl("@constructor", { fg = "#d79921" })
        hl("@tag.builtin", { fg = "#fabd2f" })

        hl("@builtin", { fg = "#d65d0e" })
        hl("@constant.builtin", { fg = "#fe8019" })
        hl("@module.builtin", { link = "@builtin" })
        hl("@type.builtin", { fg = "#d79921" })
        hl("@attribute.builtin", { link = "@builtin" })

        hl("@string.special.url", {})
        hl("@markup.link", {})
        hl("@markup.link.markdown_inline", { fg = "#83a598" })
        hl("@markup.link.vimdoc", { fg = "#fabd2f" })
        hl("@markup.link.label.markdown_inline", {})
        hl("@markup.raw.block.markdown", { fg = "#d65d0e" })
        hl("@label.markdown", { fg = "#fe8019" })
        hl("@markup", { fg = "#8ec07c" })
        hl("@markup.math", { fg = "#83a598" })
        hl("@markup.quote", { fg = "#d5c4a1" })
        hl("@markup.list", { fg = "#fb4934" })
        hl("@markup.list.checked", { fg = "#a89984" })

        hl("Added", { fg = "#b8bb26" })
        hl("Removed", { fg = "#fb4934" })
        hl("Changed", { fg = "#83a598" })

        hl("DiagnosticOk", { fg = "#b8bb26" })
        hl("DiagnosticInfo", { fg = "#928374" })
        hl("DiagnosticHint", { fg = "#a89984" })
        hl("DiagnosticWarn", { fg = "#fabd2f" })
        hl("DiagnosticError", { fg = "#fb4934" })
        hl("DiagnosticUnnecessary", { link = "Comment" })

        hl("WarningMsg", { fg = "#d79921" })

        hl("TelescopeTitle", { fg = "#fe8019" })
        hl("TelescopeSelection", { bg = "#282828" })
        hl("TelescopeSelectionCaret", { fg = "#d65d0e", bg = "#282828" })
        hl("TelescopeBorder", { fg = "#928374" })

        hl("GitGraphHash", { link = "Identifier" })
        hl("GitGraphTimestamp", { link = "SpecialChar" })
        hl("GitGraphBranchMsg", {})
        hl("GitGraphAuthor", { link = "String" })
        hl("GitGraphBranchName", { link = "gitCommitBranch" })
      end

      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = { "base16-gruvbox-dark-hard" },
        callback = overwrite_gruv,
      })
    end,
  },

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
          StatusLine = { bg = "#202020" },
          Normal = { bg = "#151515" },
          NormalFloat = { bg = "#000000" },
          Float = { bg = "#000000" },
          NormalNC = { bg = "#151515" },
          ["@type.builtin"] = { fg = "$coral" },
        },
        colors = {
          --bg0 = "#151515"
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
