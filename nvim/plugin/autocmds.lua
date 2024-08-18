vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=30} ]]

local afgroup = vim.api.nvim_create_augroup("autoformatopts", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
  command = [[silent! lua vim.opt.formatoptions =
	vim.opt.formatoptions
	- "a"
	- "t"
	+ "c"
	+ "q"
	- "o"
	+ "r"
	+ "n"
	+ "j"
	- "2"]],
  group = afgroup,
})

local text = vim.api.nvim_create_augroup("text", { clear = true })
for _, pat in ipairs { "text", "markdown", "mail", "gitcommit" } do
  vim.api.nvim_create_autocmd("Filetype", {
    pattern = pat,
    group = text,
    command = "setlocal spell tw=72 colorcolumn=73",
  })
end
