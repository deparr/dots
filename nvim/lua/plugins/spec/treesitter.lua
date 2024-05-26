return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "vimdoc",
          "lua",
          "vim",
          "c",
          "go",
          "rust",
          "typescript",
          "javascript",
        },
        highlight = {
          enable = true,
        },
      }
      if require("compat").is_windows then
        require("nvim-treesitter.install").compilers = { "zig", "gcc" }
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "VeryLazy" },
  },
}
