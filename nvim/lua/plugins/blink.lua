return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    ---@module 'blink-cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
      },
      sources = {
        default = { "lazydev", "lsp", "path", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      cmdline = { enabled = false },
      signature = { enabled = true },
      completion = {
        accept = { auto_brackets = { enabled = false } },
        ghost_text = { enabled = true },
        documentation = { auto_show = false, auto_show_delay_ms = 300 },
      },
      fuzzy = { implementation = "rust" },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
    end,
  },
}
