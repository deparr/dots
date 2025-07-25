-- this file generated by tairiki.dump.colors_file()
if vim.g.colors_name then vim.cmd "hi clear" end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "tomorrow-night"
local h = vim.api.nvim_set_hl
h(0,"@attribute",{link = "PreProc"})
h(0,"@boolean",{link = "Boolean"})
h(0,"@character",{link = "String"})
h(0,"@character.special",{link = "SpecialChar"})
h(0,"@comment",{link = "Comment"})
h(0,"@comment.error",{fg = "#cc6666"})
h(0,"@comment.markdown",{fg = "#969896"})
h(0,"@comment.note",{fg = "#8abeb7"})
h(0,"@comment.todo",{fg = "#f0c674"})
h(0,"@comment.warning",{fg = "#de935f"})
h(0,"@constant",{link = "Constant"})
h(0,"@constant.builtin",{link = "@constant"})
h(0,"@constant.macro",{link = "Macro"})
h(0,"@constructor",{fg = "#c5c8c6"})
h(0,"@constructor.ocaml",{fg = "#de935f"})
h(0,"@diff.delta",{link = "DiffChange"})
h(0,"@diff.minus",{link = "DiffDelete"})
h(0,"@diff.plus",{link = "DiffAdd"})
h(0,"@function",{link = "Function"})
h(0,"@function.builtin",{fg = "#de935f"})
h(0,"@function.macro",{link = "Macro"})
h(0,"@keyword",{fg = "#b294bb"})
h(0,"@keyword.conditional",{link = "Conditional"})
h(0,"@keyword.coroutine",{fg = "#b294bb"})
h(0,"@keyword.directive",{fg = "#b294bb"})
h(0,"@keyword.function",{fg = "#b294bb"})
h(0,"@keyword.modifier",{fg = "#b294bb"})
h(0,"@label",{fg = "#81a2be"})
h(0,"@lsp.mod.abstract",{})
h(0,"@lsp.mod.async",{})
h(0,"@lsp.mod.declaration",{})
h(0,"@lsp.mod.defaultLibrary",{})
h(0,"@lsp.mod.definition",{})
h(0,"@lsp.mod.deprecated",{strikethrough = true})
h(0,"@lsp.mod.documentation",{})
h(0,"@lsp.mod.modification",{})
h(0,"@lsp.mod.readonly",{})
h(0,"@lsp.mod.static",{})
h(0,"@lsp.type",{})
h(0,"@lsp.type.builtinType",{link = "@type.builtin"})
h(0,"@lsp.type.class",{fg = "#f0c674"})
h(0,"@lsp.type.comment",{fg = "#969896"})
h(0,"@lsp.type.decorator",{link = "Macro"})
h(0,"@lsp.type.enum",{fg = "#f0c674"})
h(0,"@lsp.type.enumMember",{fg = "#de935f"})
h(0,"@lsp.type.event",{fg = "#c5c8c6"})
h(0,"@lsp.type.function",{fg = "#81a2be"})
h(0,"@lsp.type.interface",{fg = "#f0c674"})
h(0,"@lsp.type.keyword",{fg = "#b294bb"})
h(0,"@lsp.type.macro",{link = "Macro"})
h(0,"@lsp.type.method",{fg = "#81a2be"})
h(0,"@lsp.type.modifier",{fg = "#b294bb"})
h(0,"@lsp.type.namespace",{fg = "#c5c8c6"})
h(0,"@lsp.type.number",{fg = "#de935f"})
h(0,"@lsp.type.operator",{fg = "#8abeb7"})
h(0,"@lsp.type.parameter",{fg = "#c5c8c6"})
h(0,"@lsp.type.property",{fg = "#c5c8c6"})
h(0,"@lsp.type.regexp",{fg = "#c5c8c6"})
h(0,"@lsp.type.string",{fg = "#b5bd68"})
h(0,"@lsp.type.struct",{fg = "#f0c674"})
h(0,"@lsp.type.type",{fg = "#f0c674"})
h(0,"@lsp.type.typeParameter",{fg = "#d8b268"})
h(0,"@lsp.type.variable",{})
h(0,"@markup.heading",{link = "Title"})
h(0,"@markup.italic",{italic = true})
h(0,"@markup.link",{fg = "#81a2be"})
h(0,"@markup.link.label",{fg = "#de935f"})
h(0,"@markup.link.url",{underline = true})
h(0,"@markup.list",{link = "Special"})
h(0,"@markup.list.checked",{bold = true,fg = "#ffca64"})
h(0,"@markup.list.unchecked",{bold = true,fg = "#afb2b0"})
h(0,"@markup.math",{fg = "#8abeb7"})
h(0,"@markup.quote",{fg = "#c5c8c6"})
h(0,"@markup.raw",{link = "String"})
h(0,"@markup.strikethrough",{strikethrough = true})
h(0,"@markup.strong",{bold = true})
h(0,"@markup.underline",{underline = true})
h(0,"@module",{fg = "#b1bdc4"})
h(0,"@module.builtin",{fg = "#c5c8c6"})
h(0,"@number",{link = "Number"})
h(0,"@number.float",{link = "Float"})
h(0,"@operator",{link = "Operator"})
h(0,"@operator.gleam",{fg = "#b294bb"})
h(0,"@operator.powershell",{fg = "#f0c674"})
h(0,"@property",{fg = "#c5c8c6"})
h(0,"@punctuation.bracket",{fg = "#afb2b0"})
h(0,"@punctuation.delimiter",{fg = "#afb2b0"})
h(0,"@punctuation.special",{fg = "#c5c8c6"})
h(0,"@string",{link = "String"})
h(0,"@string.special.url",{fg = "#8abeb7",underline = true})
h(0,"@string.special.url.comment",{link = "Comment"})
h(0,"@string.special.url.gdscript",{fg = "#7faea8",italic = true})
h(0,"@string.special.url.gomod",{fg = "#7faea8",underline = false})
h(0,"@string.special.url.gosum",{fg = "#7faea8",underline = false})
h(0,"@string.special.url.svelte",{fg = "#b5bd68"})
h(0,"@tag",{link = "Label"})
h(0,"@tag.attribute",{link = "@property"})
h(0,"@tag.builtin",{fg = "#cc6666"})
h(0,"@tag.delimiter",{link = "Delimiter"})
h(0,"@type",{fg = "#f0c674"})
h(0,"@type.builtin",{fg = "#de935f"})
h(0,"@variable",{fg = "#c5c8c6"})
h(0,"@variable.builtin",{fg = "#c5c8c6"})
h(0,"@variable.member",{fg = "#c5c8c6"})
h(0,"@variable.parameter",{fg = "#c5c8c6"})
h(0,"@variable.parameter.builtin",{fg = "#c5c8c6"})
h(0,"@variable.powershell",{fg = "#de935f"})
h(0,"Added",{fg = "#b5bd68"})
h(0,"BlinkCmpGhostText",{fg = "#969896"})
h(0,"BlinkCmpKindClass",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindColor",{reverse = false})
h(0,"BlinkCmpKindConstant",{fg = "#de935f",reverse = false})
h(0,"BlinkCmpKindConstructor",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindEnum",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindEnumMember",{fg = "#de935f",reverse = false})
h(0,"BlinkCmpKindEvent",{fg = "#b294bb",reverse = false})
h(0,"BlinkCmpKindField",{fg = "#c5c8c6",reverse = false})
h(0,"BlinkCmpKindFile",{fg = "#afb2b0",reverse = false})
h(0,"BlinkCmpKindFolder",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindFunction",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindInterface",{fg = "#f0c674",reverse = false})
h(0,"BlinkCmpKindKeyword",{fg = "#b294bb",reverse = false})
h(0,"BlinkCmpKindMethod",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindModule",{fg = "#b1bdc4",reverse = false})
h(0,"BlinkCmpKindOperator",{fg = "#8abeb7",reverse = false})
h(0,"BlinkCmpKindProperty",{fg = "#c5c8c6",reverse = false})
h(0,"BlinkCmpKindReference",{fg = "#afb2b0",reverse = false})
h(0,"BlinkCmpKindSnippet",{fg = "#de935f",reverse = false})
h(0,"BlinkCmpKindStruct",{fg = "#b294bb",reverse = false})
h(0,"BlinkCmpKindText",{fg = "#afb2b0",reverse = false})
h(0,"BlinkCmpKindTypeParameter",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindUnit",{fg = "#81a2be",reverse = false})
h(0,"BlinkCmpKindValue",{fg = "#de935f",reverse = false})
h(0,"BlinkCmpKindVariable",{fg = "#c5c8c6",reverse = false})
h(0,"BlinkCmpLabelDeprecated",{fg = "#969896",strikethrough = true})
h(0,"Bold",{bold = true})
h(0,"Boolean",{fg = "#de935f"})
h(0,"Changed",{fg = "#81a2be"})
h(0,"Character",{fg = "#b5bd68"})
h(0,"ColorColumn",{bg = "#282a2e"})
h(0,"Comment",{fg = "#969896"})
h(0,"CompileModeCheckResult",{bold = true,fg = "#de935f"})
h(0,"CompileModeCheckTarget",{fg = "#de935f"})
h(0,"CompileModeCommandOutput",{bold = false,fg = "#81a2be"})
h(0,"CompileModeDirectoryMessage",{bold = false,fg = "#81a2be"})
h(0,"CompileModeError",{bold = false,fg = "#cc6666"})
h(0,"CompileModeErrorLocus",{link = "Visual"})
h(0,"CompileModeInfo",{bold = false,fg = "#b5bd68"})
h(0,"CompileModeMessage",{bold = false,fg = "none",underline = true})
h(0,"CompileModeMessageCol",{bold = false,fg = "#8abeb7"})
h(0,"CompileModeMessageRow",{bold = false,fg = "#b294bb"})
h(0,"CompileModeOutputFile",{bold = true,fg = "#b294bb"})
h(0,"CompileModeWarning",{bold = false,fg = "#f0c674"})
h(0,"Conceal",{fg = "#969896"})
h(0,"Conditional",{fg = "#b294bb"})
h(0,"Constant",{fg = "#de935f"})
h(0,"CurSearch",{bg = "#de935f",fg = "#1d1f21"})
h(0,"Cursor",{bg = "#c5c8c6",fg = "#1d1f21"})
h(0,"CursorColumn",{bg = "#282a2e"})
h(0,"CursorIM",{bg = "#c5c8c6",fg = "#1d1f21"})
h(0,"CursorLine",{bg = "#282a2e"})
h(0,"CursorLineFold",{link = "FoldColumn"})
h(0,"CursorLineNr",{bold = true,fg = "#c5c8c6"})
h(0,"CursorLineSign",{link = "SignColumn"})
h(0,"Debug",{fg = "#de935f"})
h(0,"Define",{fg = "#b294bb"})
h(0,"Delimiter",{fg = "#afb2b0"})
h(0,"DiagnosticError",{fg = "#cc6666"})
h(0,"DiagnosticHint",{fg = "#858886"})
h(0,"DiagnosticInfo",{fg = "#8abeb7"})
h(0,"DiagnosticOk",{fg = "#b5bd68"})
h(0,"DiagnosticUnderlineError",{sp = "#cc6666",undercurl = true,underline = false})
h(0,"DiagnosticUnderlineHint",{sp = "#858886",undercurl = true,underline = false})
h(0,"DiagnosticUnderlineInfo",{sp = "#8abeb7",undercurl = true,underline = false})
h(0,"DiagnosticUnderlineOk",{sp = "#b5bd68",undercurl = true,underline = false})
h(0,"DiagnosticUnderlineWarn",{sp = "#de935f",undercurl = true,underline = true})
h(0,"DiagnosticVirtualTextError",{bg = "#2f2628",fg = "#cc6666"})
h(0,"DiagnosticVirtualTextHint",{bg = "#272a2b",fg = "#858886"})
h(0,"DiagnosticVirtualTextInfo",{bg = "#282f30",fg = "#8abeb7"})
h(0,"DiagnosticVirtualTextOk",{bg = "#2c2f28",fg = "#b5bd68"})
h(0,"DiagnosticVirtualTextWarn",{bg = "#302b27",fg = "#de935f"})
h(0,"DiagnosticWarn",{fg = "#de935f"})
h(0,"DiffAdd",{bg = "#494e56",fg = "#b5bd68"})
h(0,"DiffChange",{bg = "#494e56",fg = "#f0c674"})
h(0,"DiffDelete",{bg = "#494e56",fg = "#cc6666"})
h(0,"DiffText",{bg = "#de935f",fg = "#494e56"})
h(0,"DiffviewCursorLine",{link = "CursorLine"})
h(0,"DiffviewEndOfBuffer",{link = "EndOfBuffer"})
h(0,"DiffviewFilePanelCounter",{fg = "#de935f"})
h(0,"DiffviewFilePanelDeletions",{fg = "#cc6666"})
h(0,"DiffviewFilePanelFileName",{fg = "#afb2b0"})
h(0,"DiffviewFilePanelInsertions",{fg = "#b5bd68"})
h(0,"DiffviewFilePanelPath",{fg = "#afb2b0"})
h(0,"DiffviewFilePanelRootPath",{fg = "#afb2b0"})
h(0,"DiffviewFilePanelTitle",{fg = "#b294bb"})
h(0,"DiffviewFolderSign",{fg = "#81a2be"})
h(0,"DiffviewNormal",{link = "Normal"})
h(0,"DiffviewSignColumn",{link = "SignColumn"})
h(0,"DiffviewStatusAdded",{fg = "#b5bd68"})
h(0,"DiffviewStatusBroken",{fg = "#cc6666"})
h(0,"DiffviewStatusCopied",{fg = "#de935f"})
h(0,"DiffviewStatusDeleted",{fg = "#cc6666"})
h(0,"DiffviewStatusLine",{link = "StatusLine"})
h(0,"DiffviewStatusLineNC",{link = "StatusLineNC"})
h(0,"DiffviewStatusModified",{fg = "#de935f"})
h(0,"DiffviewStatusRenamed",{fg = "#de935f"})
h(0,"DiffviewStatusTypeChange",{fg = "#de935f"})
h(0,"DiffviewStatusUnknown",{fg = "#cc6666"})
h(0,"DiffviewStatusUnmerged",{fg = "#81a2be"})
h(0,"DiffviewStatusUntracked",{fg = "#cc6666"})
h(0,"DiffviewVertSplit",{link = "VertSplit"})
h(0,"Directory",{fg = "#81a2be"})
h(0,"EndOfBuffer",{fg = "#1d1f21"})
h(0,"Error",{fg = "#cc6666"})
h(0,"ErrorMsg",{bold = true,fg = "#cc6666"})
h(0,"Exception",{fg = "#cc6666"})
h(0,"Float",{fg = "#de935f"})
h(0,"FloatBorder",{bg = "#282a2e",fg = "#afb2b0"})
h(0,"FloatFooter",{link = "FloatTitle"})
h(0,"FloatTitle",{bg = "#282a2e",bold = true,fg = "#c5c8c6"})
h(0,"FoldColumn",{bg = "#1d1f21"})
h(0,"Folded",{bg = "#1d1f21",fg = "#969896"})
h(0,"Function",{fg = "#81a2be"})
h(0,"GitSignsAdd",{fg = "#b5bd68"})
h(0,"GitSignsAddLn",{fg = "#b5bd68"})
h(0,"GitSignsAddNr",{fg = "#b5bd68"})
h(0,"GitSignsChange",{fg = "#8abeb7"})
h(0,"GitSignsChangeLn",{fg = "#8abeb7"})
h(0,"GitSignsChangeNr",{fg = "#8abeb7"})
h(0,"GitSignsDelete",{fg = "#cc6666"})
h(0,"GitSignsDeleteLn",{fg = "#cc6666"})
h(0,"GitSignsDeleteNr",{fg = "#cc6666"})
h(0,"Identifier",{fg = "#c5c8c6"})
h(0,"Ignore",{fg = "#afb2b0"})
h(0,"IncSearch",{bg = "#de935f",fg = "#1d1f21"})
h(0,"Include",{fg = "#81a2be"})
h(0,"Italic",{italic = true})
h(0,"Keyword",{fg = "#b294bb"})
h(0,"Label",{fg = "#81a2be"})
h(0,"LineNr",{fg = "#373b41"})
h(0,"LineNrAbove",{link = "LineNr"})
h(0,"LineNrBelow",{link = "LineNr"})
h(0,"LspCodeLens",{fg = "#969896",italic = true})
h(0,"LspCodeLensSeparator",{fg = "#afb2b0",italic = true})
h(0,"LspInfoBorder",{bg = "#282a2e",fg = "#afb2b0"})
h(0,"LspInlayHint",{link = "NonText"})
h(0,"LspReferenceRead",{bg = "#323435"})
h(0,"LspReferenceTarget",{bg = "#323435"})
h(0,"LspReferenceText",{bg = "#323435"})
h(0,"LspReferenceWrite",{bg = "#323435"})
h(0,"LspSignatureActiveParameter",{bold = true,underline = true})
h(0,"Macro",{fg = "#de935f"})
h(0,"MatchParen",{bg = "#373b41"})
h(0,"ModeMsg",{fg = "#b5bd68"})
h(0,"MoreMsg",{fg = "#b5bd68"})
h(0,"MsgArea",{bg = "none",fg = "none"})
h(0,"MsgSeparator",{link = "StatusLine"})
h(0,"NonText",{fg = "#373b41"})
h(0,"Normal",{bg = "#1d1f21",fg = "#c5c8c6"})
h(0,"NormalFloat",{bg = "#282a2e",fg = "#c5c8c6"})
h(0,"NormalNC",{bg = "none",fg = "none"})
h(0,"Number",{fg = "#de935f"})
h(0,"OilChange",{fg = "#f0c674"})
h(0,"OilCopy",{fg = "#b5bd68"})
h(0,"OilDirHidden",{link = "OilDir"})
h(0,"OilHidden",{fg = "#858886"})
h(0,"Operator",{fg = "#8abeb7"})
h(0,"PMenu",{bg = "#373b41",fg = "#c5c8c6"})
h(0,"PMenuSel",{bg = "#373b41",fg = "#c5c8c6",reverse = true})
h(0,"Pmenu",{bg = "#282a2e",fg = "#afb2b0"})
h(0,"PmenuExtra",{link = "Pmenu"})
h(0,"PmenuExtraSel",{link = "PmenuSel"})
h(0,"PmenuKind",{link = "Pmenu"})
h(0,"PmenuKindSel",{link = "PmenuSel"})
h(0,"PmenuMatch",{bold = true})
h(0,"PmenuMatchSel",{bold = true})
h(0,"PmenuSbar",{bg = "#323435",fg = "none"})
h(0,"PmenuSel",{bg = "#323435",fg = "#81a2be"})
h(0,"PmenuThumb",{bg = "#858886",fg = "#858886"})
h(0,"PreCondit",{fg = "#b294bb"})
h(0,"PreProc",{fg = "#b294bb"})
h(0,"Question",{fg = "#b5bd68"})
h(0,"QuickFixLine",{bg = "#323435"})
h(0,"Removed",{fg = "#cc6666"})
h(0,"Repeat",{fg = "#b294bb"})
h(0,"Search",{bg = "#f0c674",fg = "#1d1f21"})
h(0,"SignColumn",{bg = "#1d1f21",fg = "#c5c8c6"})
h(0,"SnippetTabstop",{link = "Visual"})
h(0,"Special",{bold = false,fg = "#c5c8c6"})
h(0,"SpecialChar",{fg = "#c5c8c6"})
h(0,"SpecialComment",{link = "Comment"})
h(0,"SpecialKey",{fg = "#373b41"})
h(0,"SpellBad",{sp = "#cc6666",undercurl = true,underline = false})
h(0,"SpellCap",{sp = "#afb2b0",undercurl = true,underline = false})
h(0,"SpellLocal",{sp = "#afb2b0",undercurl = true,underline = false})
h(0,"SpellRare",{sp = "#b294bb",undercurl = true,underline = false})
h(0,"Statement",{bold = false,fg = "#c5c8c6"})
h(0,"StatusLine",{bg = "#282a2e",fg = "#afb2b0"})
h(0,"StatusLineNC",{bg = "#282a2e",fg = "#969896"})
h(0,"StatusLineTerm",{bg = "#282a2e",fg = "#afb2b0"})
h(0,"StatusLineTermNC",{bg = "#282a2e",fg = "#969896"})
h(0,"StorageClass",{fg = "#b294bb"})
h(0,"String",{fg = "#b5bd68"})
h(0,"Structure",{fg = "#b294bb"})
h(0,"Substitute",{link = "CurSearch"})
h(0,"TabLine",{bg = "#1d1f21",fg = "#969896"})
h(0,"TabLineFill",{bg = "#1d1f21"})
h(0,"TabLineSel",{bg = "#969896",fg = "#1d1f21"})
h(0,"Tag",{fg = "#cc6666"})
h(0,"TelescopeBorder",{fg = "#858886"})
h(0,"TelescopeMatching",{fg = "#de935f"})
h(0,"TelescopeMultiSelection",{fg = "#de935f"})
h(0,"TelescopeTitle",{fg = "#de935f"})
h(0,"TermCursor",{link = "Cursor"})
h(0,"TermCursorNC",{})
h(0,"Title",{bold = false,fg = "#c5c8c6"})
h(0,"Todo",{bg = "#1d1f21",fg = "#969896"})
h(0,"Type",{fg = "#81a2be"})
h(0,"Typedef",{fg = "#f0c674"})
h(0,"Underlined",{underline = true})
h(0,"Visual",{bg = "#373b41",bold = false,fg = "none"})
h(0,"VisualNOS",{link = "Visual"})
h(0,"WarningMsg",{bold = false,fg = "#cc6666"})
h(0,"Whitespace",{fg = "#858886"})
h(0,"WildMenu",{link = "CurSearch"})
h(0,"WinBar",{link = "StatusLine"})
h(0,"WinBarNC",{link = "StatusLineNC"})
h(0,"WinSeparator",{fg = "#858886"})
h(0,"cConditional",{fg = "#b294bb"})
h(0,"cRepeat",{fg = "#b294bb"})
h(0,"cStorageClass",{fg = "#b294bb"})
h(0,"cType",{fg = "#f0c674"})
h(0,"coffeeConditional",{fg = "#b294bb"})
h(0,"coffeeKeyword",{fg = "#b294bb"})
h(0,"diffAdded",{link = "Added"})
h(0,"diffChanged",{link = "Changed"})
h(0,"diffFile",{fg = "#81a2be"})
h(0,"diffLine",{fg = "#8abeb7"})
h(0,"diffRemoved",{link = "Removed"})
h(0,"fugitiveHash",{fg = "#c6a563"})
h(0,"fugitiveHeader",{fg = "#969896"})
h(0,"fugitiveHeading",{fg = "#b294bb"})
h(0,"fugitiveHelpTag",{fg = "#81a2be"})
h(0,"fugitiveSection",{fg = "#afb2b0"})
h(0,"fugitiveStagedHeading",{link = "fugitiveHeading"})
h(0,"fugitiveStagedModifier",{fg = "#de935f"})
h(0,"fugitiveStagedSection",{link = "fugitiveSection"})
h(0,"fugitiveSymbolicRef",{fg = "#b5bd68"})
h(0,"fugitiveUnstagedHeading",{link = "fugitiveHeading"})
h(0,"fugitiveUnstagedModifier",{fg = "#de935f"})
h(0,"fugitiveUnstagedSection",{link = "fugitiveSection"})
h(0,"fugitiveUntrackedHeading",{link = "fugitiveHeading"})
h(0,"fugitiveUntrackedModifier",{fg = "#cc6666"})
h(0,"fugitiveUntrackedSection",{link = "fugitiveSection"})
h(0,"goBuiltins",{fg = "#de935f"})
h(0,"goConditional",{fg = "#b294bb"})
h(0,"goConstants",{fg = "#f0c674"})
h(0,"goDeclaration",{fg = "#81a2be"})
h(0,"goException",{fg = "#b294bb"})
h(0,"goRepeat",{fg = "#b294bb"})
h(0,"goStatement",{fg = "#b294bb"})
h(0,"htmlArg",{fg = "#cc6666"})
h(0,"htmlScriptTag",{fg = "#cc6666"})
h(0,"htmlTag",{fg = "#cc6666"})
h(0,"htmlTagName",{fg = "#cc6666"})
h(0,"javaScriptBraces",{fg = "#c5c8c6"})
h(0,"javaScriptConditional",{fg = "#b294bb"})
h(0,"javaScriptFunction",{fg = "#b294bb"})
h(0,"javaScriptMember",{fg = "#de935f"})
h(0,"javaScriptNumber",{fg = "#de935f"})
h(0,"javaScriptRepeat",{fg = "#b294bb"})
h(0,"lCursor",{bg = "#c5c8c6",fg = "#1d1f21"})
h(0,"phpConditional",{fg = "#b294bb"})
h(0,"phpKeyword",{fg = "#b294bb"})
h(0,"phpMemberSelector",{fg = "#c5c8c6"})
h(0,"phpRepeat",{fg = "#b294bb"})
h(0,"phpStatement",{fg = "#b294bb"})
h(0,"phpVarSelector",{fg = "#cc6666"})
h(0,"pythonConditional",{fg = "#b294bb"})
h(0,"pythonException",{fg = "#b294bb"})
h(0,"pythonFunction",{fg = "#81a2be"})
h(0,"pythonInclude",{fg = "#b294bb"})
h(0,"pythonRepeat",{fg = "#b294bb"})
h(0,"pythonStatement",{fg = "#b294bb"})
h(0,"rubyAttribute",{fg = "#81a2be"})
h(0,"rubyConditional",{fg = "#b294bb"})
h(0,"rubyConstant",{fg = "#f0c674"})
h(0,"rubyCurlyBlock",{fg = "#de935f"})
h(0,"rubyInclude",{fg = "#81a2be"})
h(0,"rubyInterpolationDelimiter",{fg = "#de935f"})
h(0,"rubyLocalVariableOrMethod",{fg = "#de935f"})
h(0,"rubyRepeat",{fg = "#b294bb"})
h(0,"rubyStringDelimiter",{fg = "#b5bd68"})
h(0,"rubySymbol",{fg = "#b5bd68"})
h(0,"vimCommand",{fg = "#cc6666"})

if vim.g.neovide then
  vim.g.terminal_color_0 = "#323232"
  vim.g.terminal_color_1 = "#ac4242"
  vim.g.terminal_color_2 = "#90a959"
  vim.g.terminal_color_3 = "#f4bf75"
  vim.g.terminal_color_4 = "#6a9fb5"
  vim.g.terminal_color_5 = "#aa759f"
  vim.g.terminal_color_6 = "#75b5aa"
  vim.g.terminal_color_7 = "#d8d8d8"
  vim.g.terminal_color_8 = "#6b6b6b"
  vim.g.terminal_color_9 = "#c55555"
  vim.g.terminal_color_10 = "#aac474"
  vim.g.terminal_color_11 = "#feca88"
  vim.g.terminal_color_12 = "#82b8c8"
  vim.g.terminal_color_13 = "#c28cb8"
  vim.g.terminal_color_14 = "#93d3c3"
  vim.g.terminal_color_15 = "#f8f8f8"
end
