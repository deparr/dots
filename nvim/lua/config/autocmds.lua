local afgroup = vim.api.nvim_create_augroup('autoformatopts', { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufRead"}, {
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

vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=30} ]]

