return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      vim.filetype.add { extension = { ebnf = "ebnf" } }
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "vimdoc",
          "lua",
          "vim",
          "bash",
          "c",
          "go",
          "rust",
          "javascript",
          "zig",
          "gdscript",
          "python",
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
      if require("util").is_windows then
        require("nvim-treesitter.install").compilers = { "zig", "gcc" }
      end

      require("nvim-treesitter.install").prefer_git = false
    end,
  },
}
