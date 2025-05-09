local white = "#c5c8c6"
local purple = "#b294bb"
local blue = "#81a2be"
local cyan = "#8abeb7"
local green = "#b5bd68"
local yellow = "#d7af5f" -- sonokai yellow
local orange = "#de935f"
local gray = "#696969"
local red = "#cc6666"

local h = {
  ["@attribute"] = { fg = yellow },
  ["@attribute.builtin"] = { fg = yellow },
  ["@boolean"] = { fg = orange },
  ["@character"] = { fg = green },
  ["@character.special"] = { fg = white },
  ["@comment"] = { fg = gray },
  ["@comment.documentation"] = { fg = gray },
  ["@comment.error"] = { fg = red },
  ["@comment.note"] = { fg = gray },
  ["@comment.todo"] = { fg = gray },
  ["@comment.warning"] = { fg = gray },
  ["@constant"] = { fg = white, bold = true },
  ["@constant.builtin"] = { fg = orange },
  ["@constant.macro"] = { fg = yellow },
  ["@constructor"] = { fg = white },
  ["@diff.delta"] = { fg = blue },
  ["@diff.minus"] = { fg = red },
  ["@diff.plus"] = { fg = green },
  ["@function"] = { fg = blue },
  ["@function.builtin"] = { fg = yellow },
  ["@function.call"] = { fg = white },
  ["@function.macro"] = { fg = yellow },
  ["@function.method"] = { fg = blue },
  ["@function.method.call"] = { fg = white },
  ["@keyword"] = { fg = purple },
  ["@keyword.conditional"] = { fg = purple },
  ["@keyword.conditional.ternary"] = { fg = cyan },
  ["@keyword.coroutine"] = { fg = purple },
  ["@keyword.debug"] = { fg = purple },
  ["@keyword.directive"] = { fg = purple },
  ["@keyword.directive.define"] = { fg = purple },
  ["@keyword.exception"] = { fg = purple },
  ["@keyword.function"] = { fg = purple },
  ["@keyword.import"] = { fg = purple },
  ["@keyword.modifier"] = { fg = purple },
  ["@keyword.operator"] = { fg = purple },
  ["@keyword.repeat"] = { fg = purple },
  ["@keyword.return"] = { fg = purple },
  ["@keyword.type"] = { fg = purple },
  ["@label"] = { fg = yellow },
  ["@markup.heading"] = { fg = white, bold = true },
  ["@markup.heading.1"] = { fg = white, bold = true },
  ["@markup.heading.2"] = { fg = white, bold = true },
  ["@markup.heading.3"] = { fg = white, bold = true },
  ["@markup.heading.4"] = { fg = white, bold = true },
  ["@markup.heading.5"] = { fg = white, bold = true },
  ["@markup.heading.6"] = { fg = white, bold = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.link"] = { fg = blue },
  ["@markup.link.label"] = { fg = orange },
  ["@markup.link.url"] = { underline = true },
  ["@markup.list"] = { fg = white },
  ["@markup.list.checked"] = { fg = green },
  ["@markup.list.unchecked"] = { fg = yellow },
  ["@markup.math"] = { fg = cyan },
  ["@markup.quote"] = { fg = gray },
  ["@markup.raw"] = { fg = white },
  ["@markup.raw.block"] = { fg = white },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.strong"] = { bold = true },
  ["@markup.underline"] = { underline = true },
  ["@module"] = { fg = white },
  ["@module.builtin"] = { fg = white },
  ["@number"] = { fg = orange },
  ["@number.float"] = { fg = orange },
  ["@operator"] = { fg = cyan },
  ["@property"] = { fg = white },
  ["@punctuation.bracket"] = { fg = white },
  ["@punctuation.delimiter"] = { fg = white },
  ["@punctuation.special"] = { fg = orange },
  ["@string"] = { fg = green },
  ["@string.documentation"] = { fg = green },
  ["@string.escape"] = { fg = red },
  ["@string.regexp"] = { fg = red },
  ["@string.special"] = { fg = red },
  ["@string.special.path"] = { fg = red },
  ["@string.special.symbol"] = { fg = red },
  ["@string.special.url"] = { fg = cyan },
  ["@tag"] = { fg = blue },
  ["@tag.attribute"] = { fg = yellow },
  ["@tag.builtin"] = { fg = blue },
  ["@tag.delimiter"] = { fg = white },
  ["@type"] = { fg = white },
  ["@type.builtin"] = { fg = orange },
  ["@type.definition"] = { fg = cyan, bold = true },
  ["@variable"] = { fg = white },
  ["@variable.builtin"] = { fg = white },
  ["@variable.member"] = { fg = white },
  ["@variable.parameter"] = { fg = white },
  ["@variable.parameter.builtin"] = { fg = white },
}

return h
