local harpoon = require "harpoon"
harpoon:setup {
  settings = {
    save_on_toggle = true,
  },
}

local nav_opts = { ui_nav_wrap = true }

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "harpoonadd" })
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list(), {
    ui_width_ratio = 0.40,
    title_pos = "center",
    border = "rounded",
  })
end, { desc = "harpoon menu" })

-- USE HARPOON MORE
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev(nav_opts)
end, { desc = "harpoon prev" })

vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next(nav_opts)
end, { desc = "harpoon next" })

vim.keymap.set("n", "<M-p>", function()
  harpoon:list():prev(nav_opts)
end, { desc = "harpoon prev" })

vim.keymap.set("n", "<M-n>", function()
  harpoon:list():next(nav_opts)
end, { desc = "harpoon next" })
