local M = {}

local c = require "custom.jellybeans.colors"
local vimhl = vim.api.nvim_set_hl
local hl = function(g, o)
  vimhl(0, g, o)
end
local ln = function(g, l)
  vimhl(0, g, { link = l })
end
local white = "#ffffff"
local black = "#000000"
local none = "NONE"

local function set_base()
  -- def ui groups
  hl("ColorColumn", { bg = c.gray_0 })
  hl("Conceal", { fg = c.light_blue })
  hl("CurSearch", { fg = c.bg, bg = c.yellow })
  hl("Cursor", { fg = c.bg, bg = c.pale_blue })
  hl("lCursor", { fg = c.bg, bg = c.gray_4 })
  hl("CursorIM", { link = "Cursor" })
  hl("CursorColumn", { bg = c.gray_0 })
  hl("CursorLine", { bg = c.gray_0 })
  hl("Directory", { fg = c.gray_6 })
  hl("DiffAdd", { fg = c.diff_add[1], bg = c.diff_add[2] })
  hl("DiffChange", { bg = c.diff_chg[2] })
  hl("DiffDelete", { fg = c.diff_del[1], bg = c.diff_del[2] })
  hl("DiffText", { fg = c.light_blue })
  hl("diffAdded", { link = "DiffAdd" })
  hl("diffRemoved", { link = "DiffDelete" })
  hl("EndOfBuffer", { link = "NonText" })
  hl("TermCursor", { fg = c.bg, bg = c.fg })
  hl("TermCursorNC", { fg = c.fg, bg = c.gray_3 })
  hl("ErrorMsg", { fg = c.red })
  hl("WinSeparator", { fg = c.gray_3 })
  hl("Folded", {}) -- TODO: think
  hl("FoldColumn", {}) -- TODO: think
  hl("SignColumn", {})
  hl("IncSearch", { fg = c.bg, bg = c.yellow })
  hl("Substitute", { fg = c.bg, bg = c.yellow })
  hl("LineNr", { fg = c.gray_2, bg = c.bg })
  ln("LineNrAbove", "LineNr")
  ln("LineNrBelow", "LineNr")
  hl("CursorLineNr", { fg = c.gray_4 })
  hl("CursorLineFold", {}) -- TODO: think
  hl("CursorLineSign", {}) -- TODO: think
  hl("MatchParen", { fg = "#ffffff", bg = c.dark_gray_blue, bold = true })
  hl("ModeMsg", { fg = c.gray_6 })
  hl("MsgArea", {})
  -- hl("MsgSeparator", {}) -- links to StatusLine
  hl("MoreMsg", { fg = c.purple })
  hl("NonText", { fg = c.gray_1 })
  hl("Normal", { fg = c.fg, bg = c.bg })
  hl("NormalFloat", { fg = c.fg, bg = black })
  hl("FloatBorder", { fg = c.fg, bg = black })
  -- hl("FloatTitle", {}) -- links to Title
  -- hl("FloatFooter", {}) -- lines to Title
  hl("NormalNC", { fg = c.fg })
  hl("Pmenu", { fg = c.fg, bg = c.bg })
  hl("PmenuSel", { fg = c.blue, bg = c.gray_0 })
  hl("PmenuKind", {}) -- TODO: think
  hl("PmenuKindSel", {}) -- TODO: think
  hl("PmenuExtra", {}) -- TODO: think
  hl("PmenuExtraSel", {}) -- TODO: think
  hl("PmenuSbar", {}) -- TODO: think
  hl("PmenuThumb", { bg = c.bg })
  hl("PmenuMatch", {}) -- TODO: think
  ln("PmenuMatchSel", "PmenuSel")
  hl("Question", { fg = c.gray_6 })
  hl("QuickFixLine", { fg = c.light_blue })
  hl("Search", { fg = c.light_pink, bg = c.dark_pink })
  hl("SnippetTabst", {}) -- Links to Visual
  hl("SpecialKey", { fg = c.gray_2 })
  hl("SpellBad", { fg = c.red, underline = true })
  hl("SpellCap", { fg = c.blue, underline = true })
  hl("SpellLocal", { fg = c.light_blue, underline = true })
  hl("SpellRare", { fg = c.purple, underline = true })
  hl("StatusLine", { fg = c.gray_3, bg = c.gray_0 })
  hl("StatusLineNC", { fg = c.gray_4, bg = c.gray_2 })
  hl("StatusLineTerm", {}) -- links to StatusLine
  hl("StatusLineTermNC", {})
  hl("TabLine", { fg = c.gray_3, bg = c.bg })
  hl("TabLineFill", { bg = c.bg })
  hl("TabLineSel", { fg = c.bg, bg = c.gray_3, bold = true })
  hl("Title", { fg = c.fg, bold = true })
  hl("Visual", { fg = none, bg = c.gray_1 })
  hl("VisualNOS", {}) -- links to visual
  hl("WarningMsg", { fg = c.yellow })
  hl("Whitespace", { fg = c.gray_0 })
  hl("WildMenu", {})
  hl("WinBar", {}) -- i dont use this
  hl("WinBarNC", {}) -- i dont use this

  --- def syntax groups
  hl("Comment", { fg = c.gray_3, italic = true })
  hl("Constant", { fg = c.red })
  hl("String", { fg = c.green })
  hl("StringDelimiter", { fg = c.dark_green })
  hl("Character", { fg = c.red })
  hl("Number", { fg = c.red })
  hl("Boolean", { fg = c.red })
  hl("Float", { fg = c.red })
  hl("Identifier", { fg = c.purple })
  hl("Function", { fg = c.light_yellow })
  hl("Statement", { fg = c.blue })
  -- hl("Conditional", {}) -- links to Statement
  -- hl("Repeat", {}) -- links to Statement
  -- hl("Label", {}) -- links to Statement
  hl("Operator", { link = "Structure" })
  -- ln("Keyword", {}) -- links to Statement
  hl("Exception", { fg = c.red })
  hl("PreProc", { fg = c.light_blue })
  -- hl("Include", {}) -- links to PreProc
  -- hl("Define", {}) -- links to PreProc
  hl("Macro", { fg = c.yellow }) -- TODO: not sure, I REALLY like my orange macros
  -- hl("PreCondit", {}) -- links to PreProc
  hl("Type", { fg = c.yellow })
  hl("StorageClass", { fg = c.dark_yellow })
  hl("Structure", { fg = c.light_blue })
  -- hl("Typedef", {}) -- links to type -- TODO: not sure
  hl("Special", { fg = c.dark_green })
  hl("SpecialChar", { fg = c.red }) -- links to Special
  -- hl("Tag", {}) -- links to Special
  hl("Delimiter", { fg = c.gray_blue })
  -- hl("SpecialComment", {}) -- links to Speical
  -- hl("Debug", {}) -- links to SPecial
  hl("Underlined", { fg = c.fg, underline = true })
  hl("Ignore", {})
  hl("Error", { fg = c.red })
  hl("Todo", { fg = c.yellow })
  hl("Added", { link = "DiffAdd" })
  hl("Changed", { link = "DiffChange" })
  hl("Removed", { link = "DiffDelete" })
end

-- semantic and other lsp groups
local function set_lsp()
  hl("DiagnosticInfo", { fg = c.gray_3 })
  hl("DiagnosticHint", { fg = c.gray_3 })
  hl("DiagnosticWarn", { fg = c.gray_3 })
  hl("DiagnosticError", { fg = c.red })
  hl("DiagnosticSignInfo", { fg = c.dark_gray_blue })
  hl("DiagnosticSignHint", { fg = c.purple })
  hl("DiagnosticSignWarn", { fg = c.yellow })
  hl("DiagnosticSignError", { fg = c.red })

  hl("@lsp.type.enum", {})
  hl("@lsp.type.type", {})
  hl("@lsp.type.class", {})
  hl("@lsp.type.event", {})
  hl("@lsp.type.macro", {})
  hl("@lsp.type.method", {})
  hl("@lsp.type.regexp", {})
  hl("@lsp.type.string", {})
  hl("@lsp.type.struct", {})
  hl("@lsp.type.comment", {})
  hl("@lsp.type.keyword", {})
  hl("@lsp.type.function", {})
  hl("@lsp.type.modifier", {})
  hl("@lsp.type.operator", {})
  hl("@lsp.type.property", {})
  hl("@lsp.type.variable", {})
  hl("@lsp.mod.deprecated", {})
  hl("@lsp.type.interface", {})
  hl("@lsp.type.namespace", {})
  hl("@lsp.type.enumMember", {})
  hl("@lsp.type.typeParameter", {})
end

-- specific plugin groups
local function set_plugin()
  -- cmp
  hl("CmpItemKindDefault", { fg = c.blue })
  hl("CmpItemKind", { fg = c.blue })
  ln("CmpItemKindArray", "Delimiter")
  ln("CmpItemKindBoolean", "Boolean")
  ln("CmpItemKindClass", "Type")
  ln("CmpItemKindColor", "Special")
  ln("CmpItemKindConstant", "Constant")
  ln("CmpItemKindConstructor", "Special")
  ln("CmpItemKindEnum", "@lsp.typ.enum")
  ln("CmpItemKindEnumMember", "@lsp.type.enumMember")
  ln("CmpItemKindEvent", "Special")
  ln("CmpItemKindField", "@variable.member")
  ln("CmpItemKindFile", "Normal")
  ln("CmpItemKindFolder", "Directory")
  ln("CmpItemKindFunction", "Function")
  ln("CmpItemKindInterface", "@lsp.type.interface")
  ln("CmpItemKindKey", "@variable.member")
  ln("CmpItemKindKeyword", "Keyword")
  ln("CmpItemKindMethod", "Function")
  ln("CmpItemKindModule", "PreProc")
  ln("CmpItemKindNamespace", "PreProc")
  ln("CmpItemKindNull", "@constant.builtin")
  ln("CmpItemKindNumber", "Number")
  ln("CmpItemKindObject", "Constant")
  ln("CmpItemKindOperator", "Operator")
  ln("CmpItemKindPackage", "PreProc")
  ln("CmpItemKindProperty", "@variable")
  ln("CmpItemKindReference", "Macro")
  ln("CmpItemKindSnippet", "Conceal")
  ln("CmpItemKindString", "String")
  ln("CmpItemKindStruct", "Structure")
  ln("CmpItemKindText", "Normal")
  ln("CmpItemKindTypeParameter", "@lsp.type.typeParameter")
  ln("CmpItemKindUnit", "@lsp.type.struct")
  ln("CmpItemKindValue", "String")
  ln("CmpItemKindVariable", "@variable")

  -- gitsigns
  hl("GitSignsAdd", { fg = c.dark_green })
  hl("GitSignsChange", { fg = c.light_blue })
  hl("GitSignsDelete", { fg = c.red })

  -- telescope
  -- treesitter context
  hl("TreesitterContextLineNumber", { fg = c.light_blue, bg = black })
  -- hl("TreesitterContextBottom", { underline = true })
  -- fugitive maybe ??

  -- lazy
  ln("LazyDimmed", "Comment")
end

-- non-ts lang groups
local function set_lang()
  ln("phpFunctions", "Function")
  ln("phpSuperGlobal", "Identifier")
  ln("phpQuoteSingle", "StringDelimiter")
  ln("phpQuoteDouble", "StringDelimiter")
  ln("phpBoolean", "Boolean")
  ln("phpNull", "Constant")
  ln("phpOperator", "Operator")
  ln("phpRelation", "Normal")
  ln("phpVarSelector", "Identifier")

  ln("pythonOperator", "Statement")

  ln("erlangAtom", "Statement")
  hl("erlangBIF", { fg = c.pink })
  ln("erlangFunction", "erlangBIF")
  ln("erlangDirective", "Statement")
  ln("erlangNode", "Identifier")

  ln("elixierAtom", "Statement")

  ln("javaScriptValue", "Constant")
  hl("javaScriptRegexpString", { fg = c.pink })
  ln("javaScriptTemplateVar", "StringDelimiter")
  ln("javaScriptTemplateDelim", "Identifier")
  ln("javaScriptTemplateString", "String")

  ln("luaOperator", "Conditional")

  ln("cFormat", "Identifier")
  ln("cOperator", "Constant")

  ln("vimOper", "Normal")

  ln("htmlTag", "Statement")
  ln("htmlEndTag", "htmlTag")
  ln("htmlTagName", "htmlTag")

  ln("xmlTag", "Statement")
  ln("xmlEndTag", "xmlTag")
  ln("xmlTagName", "xmlTag")
  ln("xmlEqual", "xmlTag")
  ln("xmlEntity", "Special")
  ln("xmlEntityPunct", "xmlEntity")
  ln("xmlDocTypeDecl", "PreProc")
  ln("xmlDocTypeKeyword", "PreProc")
  ln("xmlProcessingDelim", "xmlAttrib")
end

-- tree sitter groups
local function set_ts()
  ln("@variable", "Normal")
  ln("@function.builtin", "Constant")
  -- ln("@keyword.import", "Constant")

  ln("@tag.html", "Statement")
  ln("@tag.delimiter.html", "Comment")
  ln("@tag.attribute.html", "Type")
  hl("@string.special.url.html", { fg = c.pale_blue })

  -- ln("@constructor.lua", "Constant")
end

function M.set(opts)
  set_base()

  if opts.lsp then
    set_lsp()
  end

  if opts.plugin then
    set_plugin()
  end

  if opts.lang then
    set_lang()
  end

  if opts.ts then
    set_ts()
  end

  if opts.override then
    for g, o in pairs(opts.override) do
      hl(g, o)
    end
  end
end

return M
