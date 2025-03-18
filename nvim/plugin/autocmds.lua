vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 30 }
  end,
})

local afgroup = vim.api.nvim_create_augroup("autoformatopts", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2"
  end,
  group = afgroup,
})

local text = vim.api.nvim_create_augroup("text", { clear = true })
for _, pat in ipairs { "text", "markdown", "mail", "gitcommit", "djot" } do
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = pat,
    group = text,
    command = "setlocal spell tw=72 colorcolumn=73",
  })
end

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*.gd",
--   callback = function()
--     vim.bo.fileformat = "unix"
--   end,
-- })
--
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modifiable then
      vim.bo.fileformat = "unix"
    end
  end,
})
