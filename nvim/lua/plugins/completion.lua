if true then
  return {
    {
      "saghen/blink.cmp",
      version = "v0.*",
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
            }
          },
        },
        cmdline = { enabled = false },
        signature = { enabled = true },
        completion = {
          accept = { auto_brackets = { enabled = false } },
          ghost_text = { enabled = true },
          documentation = { auto_show = true, auto_show_delay_ms = 300 },
        },
      },
    },
  }
end

return {
  {
    -- Autocompletion
    -- TODO: redo cmp config
    "hrsh7th/nvim-cmp",
    -- priority = 60,
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",

      -- kind icon formatting
      -- "onsails/lspkind.nvim",

      -- dont snippets for now
      --'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      -- local lspkind = require "lspkind"

      -- want as few snippets as possible
      --require("luasnip.loaders.from_vscode").lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- don't set these, they ruin godot lsp for some reason
        -- completion = {
        --   completeopt = "menu,menuone,noinsert",
        -- },
        mapping = cmp.mapping.preset.insert {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-Space>"] = cmp.mapping.complete {},
          ["<C-y>"] = cmp.mapping.confirm { select = true },
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "lazydev", group_index = 0 },
          { name = "luasnip" },
          -- { name = "nvim_lsp_signature_help" },
          { name = "path" },
        },
        experimental = {
          ghost_text = true,
        },
      }
    end,
  },
}
