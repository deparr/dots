return {
  {
    "mbbill/undotree",
    lazy = true,
    enable = not require("util").is_windows,
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>" },
    },
  },
}
