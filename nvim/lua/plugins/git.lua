return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    },
    keys = {
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>" },
      { "<leader>gi", "<cmd>Gitsigns toggle_signs<cr>" },
      { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>" },
      { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>" },
      { "<leader>gd", "<cmd>Gitsigns diffthis<cr>" },
    },
  },
  { "sindrets/diffview.nvim" },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", "<cmd>vert Git<cr>" },
      { "<leader>gl", "<cmd>vert Git log<cr>" },
    },
  },
  -- {
  --   "isakbm/gitgraph.nvim",
  --   opts = {
  --     symbols = {
  --       merge_commit = "M",
  --       commit = "*",
  --     },
  --     format = {
  --       timestamp = "%H:%M:%S %d-%m-%Y",
  --       fields = { "hash", "timestamp", "author", "branch_name", "tag" },
  --     },
  --     hooks = {
  --       on_select_commit = function(commit)
  --         print("selected commit:", commit.hash)
  --       end,
  --       on_select_range_commit = function(from, to)
  --         print("selected range:", from.hash, to.hash)
  --       end,
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>gg",
  --       function()
  --         require("gitgraph").draw({}, { all = true, max_count = 5000 })
  --       end,
  --     },
  --   },
  -- },
}
