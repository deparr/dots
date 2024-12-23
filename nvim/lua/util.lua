-- Misc settings to be shared across plugins
local M = {}

M.float_border_style = "rounded"
M.use_icons = true
M.ts_top_prompt = true
M.is_windows = vim.uv.os_uname().sysname == "Windows_NT"
M.todo_file = M.is_windows and "V:\\todo.md" or "~/todo.md"

M.create_floating_win = function(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf }) -- Clean up buffer on close

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

return M
