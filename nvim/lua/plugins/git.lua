return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
      }
      vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>")
      vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>")
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", "<cmd>vertical Git<cr>")
    end,
  },
  {
    "isakbm/gitgraph.nvim",

    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit)
          print("selected commit:", commit.hash)
        end,
        on_select_range_commit = function(from, to)
          print("selected range:", from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gg",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "Gitgraph draw",
      },
    },
  },
}
