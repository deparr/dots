vim.g.zig_fmt_autosave = 0
vim.api.nvim_set_hl(0, "@keyword.import.zig", { link = "@function.builtin" })
vim.api.nvim_set_hl(0, "@lsp.type.type.zig", {})
vim.api.nvim_set_hl(0, "@lsp.type.keyword.zig", {})
vim.api.nvim_set_hl(0, "@lsp.type.string.zig", {})
vim.api.nvim_set_hl(0, "@lsp.type.errorTag.zig", { link = "@constant" })
