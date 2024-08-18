return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "vimdoc",
          "lua",
          "vim",
          "bash",
          "c",
          "go",
          "rust",
          "typescript",
          "javascript",
        },
        highlight = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
            },
            include_surrounding_whitespace = false,
          },
        },
      }
      if require("compat").is_windows then
        require("nvim-treesitter.install").compilers = { "zig", "gcc" }
      end
    end,
  },
}
