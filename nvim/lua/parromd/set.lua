vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.errorbells = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


-- maybe someday this will work for setting these options,
-- for now just use an autocommand
--vim.opt.formatoptions = vim.opt.formatoptions
--    - "a" -- Dont autoformat
--    - "t" -- Dont autowrap text
--    + "c" -- but wrap comments (with respect to text width
--    + "q" -- format comments with gq
--    - "o" -- O/o don't continue comments
--    + "r" -- but do on enter
--    + "n" -- auto indent number lists
--    + "j" -- remove comment leader on line joins
--    - "2" -- why are we doing mla smh

local afgroup = vim.api.nvim_create_augroup('autoformatopts', { clear = true })
vim.api.nvim_create_autocmd('BufEnter, BufRead', {
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

vim.g.mapleader = " "

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
