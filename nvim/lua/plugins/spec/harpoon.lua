return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependecies = { "nvim-lua/plenary.nvim" },
  config = function()
    require "plugins.harpoon"
  end,
}
