vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- TODO: this is for laptop, remove sometime
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<Left>", "gT")
vim.keymap.set("n", "<Right>", "gt")

vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- term
vim.keymap.set("t", "<Esc><Esc>", "<C-/><C-n>")
vim.keymap.set("t", "<M-h>", "<C-/><C-n><C-W>h")
vim.keymap.set("t", "<M-j>", "<C-/><C-n><C-W>j")
vim.keymap.set("t", "<M-k>", "<C-/><C-n><C-W>k")
vim.keymap.set("t", "<M-l>", "<C-/><C-n><C-W>l")

-- windows
--resizing
vim.api.nvim_set_keymap('n', '<A-,>', '<C-W>5<', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-.>', '<C-W>5>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-->', '<C-W>5-', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-=>', '<C-W>5+', { noremap = true })
--moving
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W><C-h>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W><C-j>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W><C-k>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W><C-l>', { noremap = true })

-- terminal keybinds
vim.keymap.set("n", "<leader>t", "<cmd>tabnew | term<cr>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<M-h>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><C-w>l", { noremap = true })
vim.keymap.set("t", "<S-Space>", "<Space>", { noremap = true })
vim.keymap.set("t", "<C-Space>", "<Space>", { noremap = true })

-- TODO: need to rethink these
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>silent !chmod +x %<CR>", { silent = true })

