return {
  {
    "mbbill/undotree",
    lazy = true,
    config = function()
      vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
    end,
  },
}
