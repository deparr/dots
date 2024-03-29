vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.guicursor = ""
vim.opt.updatetime = 50

vim.wo.nu = true
vim.wo.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.errorbells = false

vim.opt.swapfile = false
vim.opt.backup = false
-- TODO find a better way to set this cross platform
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

if require("config.settings").is_windows then
	vim.opt.shell = "pwsh.exe"
end

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.isfname:append("@-@")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

