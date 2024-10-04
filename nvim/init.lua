vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.loader.enable()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = false },
  change_detection = { enabled = true, notify = false },
  install = {
    colorscheme = {  "tokyonight-night", "tairiki", "habamax" },
  },
  dev = {
    path = "~/dev",
    patterns = { "deparr" },
  },
})

-- vim.cmd.colorscheme "tairiki"
-- vim.cmd.colorscheme "lavish"
vim.cmd.colorscheme "tokyonight-night"
-- vim.cmd "hi clear"
-- vim.cmd.colorscheme "gruvbuddy"
