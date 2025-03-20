vim.diagnostic.config {
  float = {
    source = "if_many",
    show_header = false,
    -- border = "rounded",
    severity_sort = true,
  },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
    source = "if_many",
  },
  severity_sort = true,
  signs = {
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
    },
  },
  underline = true,
}

vim.keymap.set("n", "[d", function()
  vim.buf.diagnostic.goto_prev { severity = { min = vim.diagnostic.severity.WARN } }
end)
vim.keymap.set("n", "]d", function()
  vim.buf.diagnostic.goto_next { severity = { min = vim.diagnostic.severity.WARN } }
end)
