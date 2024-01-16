-- Misc settings to be shared across plugins
local M = {}

M.float_border_style = "rounded"
M.use_icons = false
M.ts_top_prompt = true
M.is_windows = vim.loop.os_uname().sysname == "Windows_NT"

return M
