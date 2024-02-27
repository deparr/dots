local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require "config.options"
require "config.keymaps"
require "config.autocmds"
-- always load plugins last
require "config.lazy"

--[[
if pcall(require, "tairiki") then
	require("tairiki").load()
else
	vim.cmd.colorscheme("habamax")
end
--]]

-- vim.cmd.colorscheme "bamboo"
vim.cmd.colorscheme "tairiki"
