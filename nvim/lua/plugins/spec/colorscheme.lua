return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    "deparr/tairiki.nvim",
    dev = false,
    branch = "minimal",
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
    "deparr/piratebuddy.nvim",
    dev = false,
    config = function()
      require("piratebuddy").setup {
        colors = {
          bg = "#151515",
          tairiki_gray = "#a89984",
        },
        highlights = {
          ["DiffChange"] = { fg = "$blue" },
          ["DiffText"] = { fg = "$tairiki_gray" },
          ["FloatBorder"] = { fg = "$bg_dark", bg = "$bg_dark" },
          ["StatusLine"] = { fg = "$white_light", bg = "$bg_light" },
          ["SpecialChar"] = { fg = "$orange" },
          ["LspInfoBorder"] = { fg = "$bg_dark", bg = "$bg_dark" },

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
        },
      }
    end,
  },
  {
    "tjdevries/colorbuddy.nvim",
  },
  {
    "Yazeed1s/minimal.nvim",
  },
  {
    "jaredgorski/SpaceCamp",
  },
  {
    dir = "~/dev/mountain.nvim/",
  },
  {
    "folke/tokyonight.nvim",
    opts = function()
      return {
        style = "night",
        terminal_colors = false,
        transparent = false,
      }
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        enable = {
          terminal = false,
          legacy_highlights = false,
        },
        styles = {
          italic = false,
          bold = true,
        },
        highlight_groups = {
          ["Normal"] = { bg = "#151515" },
          ["NormalFloat"] = { bg = "#151515" },
        },
      }
    end,
  },
  { "shaunsingh/oxocarbon.nvim" },
  {
    "gmr458/cold.nvim",
    config = function()
      require("cold").setup {
        transparent_background = true,
        undercurl = false,
      }
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "#151515" })
      -- vim.api.nvim_set_hl(0, "SignColumn", { bg = "#151515" })
      -- vim.api.nvim_set_hl(0, "LineNr", { bg = "#151515" })
      -- vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "#151515" })
      -- vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "#151515" })
      -- error = "#984936",
      -- warning = "#ab8550",
      -- info = "#ab8550",
      -- hint = "#576f82",
      vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#576f82" })
      vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#ab8550" })
      vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ab8550" })
      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#984936" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = false, underline = true })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = false, underline = true })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = false, underline = true })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = false, underline = true })
      vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#585858", undercurl = false, underline = true })
    end,
  },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    config = function()
      require("no-clown-fiesta").setup {
        -- styles = {
        --   lsp = { underline = false }
        -- }
      }
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
