return {
	{
		"rcarriga/nvim-notify",
		--dependencies = { { "yamatsum/nvim-nonicons" } },
		config = function()
			local base = require("notify.render.base")

			-- "compact" render function copied from notify source
			local noicon_compact = function(bufnr, notif, highlights)
				local namespace = base.namespace()
				local title = notif.title[1]

				local prefix
				if type(title) == "string" and #title > 0 then
					prefix = string.format("| %s:", title)
				else
					prefix = "|"
				end
				notif.message[1] = string.format("%s %s", prefix, notif.message[1])

				vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

				local prefix_length = vim.str_utfindex(prefix)

				vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
					hl_group = highlights.title,
					end_col = prefix_length + 1,
					priority = 50,
				})
				vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, prefix_length + 1, {
					hl_group = highlights.body,
					end_line = #notif.message,
					priority = 50,
				})
			end

			local use_icons = require("config.settings").use_icons
			local opts = {
				fps = 60,
				stages = "static",
				timeout = 3000,
				render = use_icons and "compact" or noicon_compact,
				icons = use_icons and require("nvim-nonicons.extentions.nvim-notify") or nil,
				background_colour = "#000000",
			}

			require("notify").setup(opts)

			vim.notify = require "notify"
		end
	},
}

