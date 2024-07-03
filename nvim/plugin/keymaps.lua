local set = vim.keymap.set
if vim.cmd.Oil then
  set("n", "<leader>pv", vim.cmd.Oil)
else
  set("n", "<leader>pv", vim.cmd.Ex)
end

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- think about these
-- set("n", "<M-j>", function()
--   if vim.opt.diff:get() then
--     vim.cmd [[normal! ]c]]
--   else
--     vim.cmd [[m .+1<CR>==]]
--   end
-- end)
--
-- set("n", "<M-k>", function()
--   if vim.opt.diff:get() then
--     vim.cmd [[normal! [c]]
--   else
--     vim.cmd [[m .-2<CR>==]]
--   end
-- end)

-- greatest remap ever
set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", [["_d]])

-- NOTE: this is for laptop, remove sometime
set("i", "<C-c>", "<Esc>")

set("n", "<Left>", "gT")
set("n", "<Right>", "gt")

set("n", "<Down>", "<nop>")
set("n", "<Up>", "<nop>")
set("i", "<Down>", "<nop>")
set("i", "<Up>", "<nop>")
set("i", "<Left>", "<nop>")
set("i", "<Right>", "<nop>")

set("n", "Q", "<nop>")
set("n", "q:", "<nop>")
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

set("n", "<A-,>", "<C-W>5<")
set("n", "<A-.>", "<C-W>5>")
set("n", "<A-->", "<C-W>5-")
set("n", "<A-=>", "<C-W>5+")
set("n", "<C-h>", "<C-W><C-h>")
set("n", "<C-j>", "<C-W><C-j>")
set("n", "<C-k>", "<C-W><C-k>")
set("n", "<C-l>", "<C-W><C-l>")

-- TODO: need to rethink these
set("n", "<M-j>", "<cmd>cnext<CR>zz")
set("n", "<M-k>", "<cmd>cprev<CR>zz")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>silent !chmod +x %<CR>", { silent = true })
