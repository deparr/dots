vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

require("lazy").setup("plugins.spec", {
  defaults = { lazy = false },
  change_detection = { enabled = true, notify = false },
  dev = {
    path = "~/dev",
    patterns = { "deparr" },
  },
})

vim.cmd.colorscheme "cold"
