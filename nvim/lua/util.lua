-- Misc settings to be shared across plugins
local M = {}

M.float_border_style = "rounded"
M.use_icons = true
M.ts_top_prompt = true
M.is_windows = vim.uv.os_uname().sysname == "Windows_NT"
M.todo_file = M.is_windows and "V:\\todo.md" or "~/todo.md"
M.is_windows = vim.uv.os_uname().sysname:match(".*[wW]indows.*") ~= nil
M.dev_dir = M.is_windows and "V:\\Code" or "~/dev"
M.todo_file = M.is_windows and "V:\\todo.md" or "~/todo.md"
M.in_gdproj = vim.fs.root(0, function(n, _) return n == "project.godot" or n == ".godot" end) ~= nil

function M.dev(path)
  local si = path:find("/")
  if si then
    path = path:sub(si)
  end
  path = M.dev_dir .. path
  return path:gsub("//", "/")
end

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

M.dump_highlight_groups = function(path)
  if not path or #path == 0 then
    print "hl_dump: must give out path"
    return
  end
  local highlight_groups = vim.api.nvim_get_hl(0, {})
  local results = {}

  for name, def in pairs(highlight_groups) do
    local fg = def.fg and string.format("#%06x", def.fg) or "none"
    local bg = def.bg and string.format("#%06x", def.bg) or "none"
    local sp = def.sp and string.format("#%06x", def.sp) or "none"
    local res
    if def.link then
      res = string.format("%s -> %s", name, def.link)
    else
      res = string.format("%s: fg=%s, bg=%s, sp=%s", name, fg, bg, sp)
    end
    table.insert(results, res)
  end

  local file = io.open(path, "w")
  if not file then
    print(("hl_dump: unable to open '%s'"):format(path))
    return
  end
  for _, result in ipairs(results) do
    file:write(result, "\n")
  end
  file:close()
  print(("hl_dump: current highlight groups saved to '%s'"):format(path))
end

return M
