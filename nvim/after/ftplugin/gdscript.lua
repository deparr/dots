vim.api.nvim_buf_set_keymap(0, "n", "<leader>ff", "", {
  desc = "find files {godot}",
  noremap = true,
  callback = function()
    local ts = require "telescope.builtin"
    ts.fd { find_command =
      { "fd", "--type", "f", "--color", "never", "--exclude", '{addons,aseprite,assets}*' }
    }
  end,
})

vim.api.nvim_buf_set_keymap(0, "n", "<leader>fl", "", {
  desc = "find live {godot}",
  noremap = true,
  callback = function()
    local ts = require "telescope.builtin"
    ts.live_grep { glob_pattern = { "!addons*", "!aseprite*", "!assets*" } }
  end,
})
