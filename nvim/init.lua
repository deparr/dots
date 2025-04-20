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
    colorscheme = { "gruvbuddy", "habamax" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tutor",
        "netrwPlugin",
        "tarPlugin",
        "zipPlugin",
      },
    },
  },
})

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.0
  vim.g.neovide_scroll_animation_length = 0.0
  vim.g.neovide_hide_mouse_when_typing = true
  local toggle = function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end

  vim.keymap.set("n", "<m-cr>", toggle, { desc = "toggle fullscreen" })
  vim.keymap.set("n", "<f11>", toggle, { desc = "toggle fullscreen" })
end

-- require("tairiki").load()
vim.cmd.colorscheme "gruvbuddy"
