if not pcall(require, "lazy") then
	vim.notify("Lazy unavailable or not installed")
	return
end

require("lazy").setup("plugins", {
	defaults = {
		lazy = false,
	},
	change_detection = {
		enabled = true,
		notify = true,
	},
	dev = {
		path = "~/dev",
		patterns = { "deparr" },
	},
	install = { colorscheme = { "tairiki", "habamax" } }
})

