-- Misc settings to be shared across plugins
local M = {}

M.float_border_style = "rounded"
M.use_icons = true
M.ts_top_prompt = true
M.is_windows = vim.uv.os_uname().sysname == "Windows_NT"

return M
