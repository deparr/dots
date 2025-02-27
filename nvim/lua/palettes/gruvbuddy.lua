local util = require("tairiki.util")

local M = {
  bg       = "#1d1f21",
  fg       = "#d0d0d0",
  purple   = "#b294bb",
  green    = "#99cc99",
  orange   = "#de935f",
  blue     = "#618aae",
  yellow   = "#d7af5f", -- sonokai yellow, not quite what I want
  cyan     = "#8abeb7",
  red      = "#cc6666",
  comment  = "#696969",
  none     = "none",

	brown = "#a3685a",
  light_purple = "#aa93cd",
  light_blue = "#81a2b3",
}

M.bg_light  = "#242627"
M.bg_light2 = "#323435"
M.bg_light3 = "#323435"
M.fg_dark   = "#afb2b0"
M.fg_dark2  = "#959896"
M.fg_dark3  = "#959896"

function M.regen_sub_groups(self)
  self.diag     = {
    error = self.red,
    info  = self.cyan,
    warn  = self.orange,
    hint  = self.fg_dark3,
    ok    = self.green,
  }
  self.diff     = {
    add    = util.blend(self.green, self.bg, 0.3),
    remove = util.blend(self.red, self.bg, 0.1),
    change = util.blend(self.fg_dark3, self.bg, 0.3),
    text   = util.blend(self.blue, self.bg, 0.35),
  }
  self.syn      = {
    ident       = self.fg,
    constant    = self.orange,
    literal     = self.orange,
    func        = self.blue,
    string      = self.green,
    type        = self.purple,
    keyword     = self.purple,
    keyword_mod = self.purple,
    special     = self.light_purple, -- not sure I want this
    delim       = self.fg_dark3,
    exception   = self.red,
    operator    = self.fg,
  }

  -- todo: attributes and preproc
  --        operator
  --        delims being dark
  --        module - not sure purple is good, orange is good for ocaml
  self.highlights = {
    Character = { fg = self.red },
    Float = { fg = self.red },
    Label = { fg = self.yellow },
    Number = { fg = self.red },
    PreProc = { fg = self.yellow },
    SpecialChar = { fg = self.brown },
    Type = { fg = self.syn.type, italic = true },
    Structure = { fg = self.yellow },

    ["@character"] = "Character",
    ["@function.builtin"] = "@function",
    ["@label"] = "Label",
    ["@module"] = { fg = self.purple },
    ["@module.builtin"] = { fg = self.light_purple, bold = true },
    ["@property"] = { fg = self.light_blue },
    ["@lsp.type.property"] = { fg = self.light_blue },
    ["@tag"] = { fg = self.blue },
    ["@tag.attribute"] = { fg = self.yellow },
    ["@type"] = { fg = self.syn.type, italic = true },
    ["@type.builtin"] = { fg = self.light_purple },

    ["@constructor.lua"] = { fg = self.fg },
    ["@property.lua"] = { fg = self.fg },
    ["@property.gdscript"] = { fg = self.fg },

    -- hi(0, "@type.python", { fg = c.red, italic = true })
    -- hi(0, "@type.go", { fg = c.red_dark, italic = true })
    -- hi(0, "@type.go", { fg = c.violet_dark, italic = true })
  }


end

M:regen_sub_groups()

return M
