local util = require "tairiki.util"

local M = {
  fg = "#d8d8d8",
  bg = "#181818",

  bright_white = "#f8f8f8",
  white = "#d8d8d8",
  gray = "#6b6b6b",
  black = "#323232",

  red = "#ac4242",
  green = "#90a959",
  yellow = "#f4bf75",
  blue = "#6a9fb5",
  purple = "#aa759f",
  cyan = "#75b5aa",
  orange = "#cc7f40",

  bright_red = "#c55555",
  bright_green = "#aac474",
  bright_yellow = "#feca88",
  bright_blue = "#82b8c8",
  bright_purple = "#c28cb8",
  bright_cyan = "#93d3c3",
  bright_orange = "#ffaa51",

  comment = "#6b6b6b",
  none = "none",
}

M.bg_light = "#202020"
M.bg_light2 = "#282828"
M.bg_light3 = M.black
M.fg_dark = "#a8a8a8"
M.fg_dark2 = M.gray
M.fg_dark3 = M.gray

function M.regen_sub_groups(self)
  self.diag = {
    error = self.red,
    info = self.fg_dark3,
    warn = self.orange,
    hint = self.fg_dark3,
    ok = self.green,
  }
  self.diff = {
    add = util.blend(self.green, self.bg, 0.3),
    remove = util.blend(self.red, self.bg, 0.1),
    change = util.blend(self.fg_dark3, self.bg, 0.3),
    text = util.blend(self.blue, self.bg, 0.35),
  }
  self.syn = {
    ident = self.fg,
    constant = self.orange,
    literal = self.orange,
    func = self.blue,
    string = self.green,
    type = self.yellow,
    keyword = self.purple,
    keyword_mod = self.purple,
    special = self.bright_green,
    delim = self.fg_dark,
    exception = self.red,
    operator = self.fg_dark,
  }
  self.terminal = {
    black = self.black,
    red = self.red,
    green = self.green,
    yellow = self.yellow,
    blue = self.blue,
    purple = self.purple,
    cyan = self.cyan,
    white = self.white,

    bright_black = self.gray,
    bright_red = self.bright_red,
    bright_green = self.bright_green,
    bright_yellow = self.bright_yellow,
    bright_blue = self.bright_blue,
    bright_purple = self.bright_purple,
    bright_cyan = self.bright_cyan,
    bright_white = self.bright_white,
  }

  self.highlights = {
    NormalFloat = { bg = "#000000" },
    FloatTitle = { fg = self.fg, bg = "#000000", bold = true },
    FloatBorder = { fg = self.fg_dark, bg = "#000000" },
    Debug = { fg = self.red },
    Character = { fg = self.red },
    Comment = { fg = self.comment },
    Label = { fg = self.bright_cyan },
    MatchParen = { fg = self.bright_orange },
    Macro = { fg = self.bright_red },
    NonText = "Comment",
    PreProc = { fg = self.purple },
    SpecialKey = "Comment",
    SpecialChar = { fg = self.orange },
    Statement = { fg = self.purple },
    Structure = { fg = self.purple },
    Tag = { fg = self.yellow },
    Todo = { fg = self.yellow },

    -- TODO PreProc
    -- @punctuation.special.python
    ["@character"] = "Character",
    ["@conceal"] = { fg = self.fg_dark },
    ["@constructor.lua"] = { fg = self.fg },
    ["@label"] = "Label",
    ["@markup.heading.1"] = { fg = self.bright_red },
    ["@markup.heading.2"] = { fg = self.orange },
    ["@markup.heading.3"] = { fg = self.yellow },
    ["@markup.heading.4"] = { fg = self.green },
    ["@markup.heading.5"] = { fg = self.blue },
    ["@markup.heading.6"] = { fg = self.purple },
    ["@markup.list.checked"] = { fg = self.purple, bold = true },
    ["@markup.quote"] = { fg = self.fg_dark },
    ["@module"] = { fg = self.fg },
    ["@tag"] = { fg = self.blue },
    ["@tag.attribute"] = { fg = self.fg_dark },
    ["@type"] = "Type",
    ["@type.builtin"] = "@type",

    ["@type.builtin.gdshader"] = { fg = self.green },

    ["@punctuation.special.python"] = { fg = self.orange },

    ["@keyword.import.zig"] = "@function.builtin",

    ["@lsp.type.lifetime.rust"] = { fg = self.bright_green },
  }
end

M:regen_sub_groups()

return M
