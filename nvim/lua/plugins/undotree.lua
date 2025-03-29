return {
  {
    "mbbill/undotree",
    lazy = true,
    enable = not require("util").is_windows,
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
    end,
  },
}
