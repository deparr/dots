vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=30} ]]

-- thisis the onlyway I can get these formatting options to stick
-- most definitely a skill issue
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
