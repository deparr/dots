local M = {}
local default_opts = {
  ts = true,
  plugin = true,
  lsp = true,
  lang = true,
  term = false,
}

function M.setup(opts)
  vim.g.jb_nvim_opts = vim.tbl_deep_extend("force", default_opts, opts)
end

function M.load()
  vim.cmd "hi clear"
  if vim.fn.exists "syntax_on" then
    vim.cmd "syntax reset"
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "jellybeans-nvim"
  vim.o.background = "dark"

  require("custom.colors.jellybeans.highlights").set(vim.g.jb_nvim_opts)
  if vim.g.jb_nvim_opts.term then
    require("custom.colors.jellybeans.term").set()
  end
end

return M
