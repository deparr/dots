return {
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "VeryLazy" },
    config = function()
      require("Comment").setup {
        -- leaders in both normal and visual mode
        opleader = {
          line = "gc",
          block = "gb",
        },
        mappings = {
          -- gcc					-> line-comment current line
          -- gcb					-> block-comment current line
          -- gc[count]{motion}	-> line-comment region in {motion}
          -- gb[count]{motion}	-> block-comment region in {motion}
          basic = true,

          -- gco, gcO, gcA
          extra = true,
        },
        toggler = {
          line = "gcc",
          block = "gbc",
        },
      }

      local ft = require "Comment.ft"
      ft.djot = { "{% %s %}" }
    end,
  },
}
