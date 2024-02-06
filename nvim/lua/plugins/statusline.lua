return {
	{
		"tjdevries/expressline.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require"el".reset_windows()
			vim.opt.laststatus = 3

			local builtin = require "el.builtin"
			local extensions = require "el.extensions"
			local sections = require "el.sections"
			local subscribe = require "el.subscribe"
			local lsp_status = require "el.plugins.lsp_status"
			local helper = require "el.helper"
			local diagnostic = require "el.diagnostic"


			-- local has_lsp_extensions, ws_diagnostics = pcall(require, "lsp_extensions.workspace.diagnostic")

			local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
			  local icon = extensions.file_icon(_, bufnr)
			  if icon then
				return icon .. " "
			  end

			  return ""
			end)


			local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
			  local branch = extensions.git_branch(window, buffer)
			  if branch then
				return " " .. extensions.git_icon() .. " " .. branch
			  end
			end)

			local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
			  return extensions.git_changes(window, buffer)
			end)

			local diagnostic_display = diagnostic.make_buffer()

			require("el").setup {
				generator = function(window, buffer)
				local mode = extensions.gen_mode { format_string = " %s " }

				local items = {
				  { mode },
				  { git_branch },
				  { " " },
				  { sections.split },
				  { git_icon },
				  { sections.maximum_width(builtin.file_relative, 0.60) },
				  { sections.collapse_builtin { { " " }, { builtin.modified_flag } } },
				  { sections.split },
				  { diagnostic_display },
				  { git_changes },
				  { " [" },
				  { builtin.line_with_width(2) },
				  { ":" },
				  { builtin.column_with_width(2) },
				  { "]" },
				  {
					sections.collapse_builtin {
					  "[",
					  builtin.help_list,
					  builtin.readonly_list,
					  "]",
					}
				  },
				  { builtin.filetype },
				}

				local line = {}
				for _, item in ipairs(items) do
				  table.insert(line, item)
				end

				return line
				end
			}
		end
	},
}

