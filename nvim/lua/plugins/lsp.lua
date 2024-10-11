return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "stevearc/conform.nvim",
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            override_vim_notify = true,
            window = {
              winblend = 0,
              relative = "editor",
              -- normal_hl = "DiagnosticInfo"
            },
          },
          -- progress = {
          --   display = {
          --     icon_style = "String",
          --   },
          -- },
        },
      },
      {
        "folke/lazydev.nvim",
        ft = "lua",
      },
    },
    config = function()
      -- require("neodev").setup()

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          go = { "goimports", "gofmt" },
          python = { "ruff_fix", "ruff_format" },
        },
      }

      local util = require "lspconfig.util"
      local servers = {
        rust_analyzer = true,
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
        pylsp = true,
        gleam = {
          manual_install = true,
        },
        lua_ls = true,
        -- tsserver = true,
        vtsls = true,
        svelte = true,
        bashls = true,
        clangd = {
          init_options = { clangdFileStatus = true },
          filetypes = { "c", "cpp" },
        },
        zls = {
          manual_install = true,
        },
        ocamllsp = {
          manual_install = true,
          settings = {
            codelens = { enable = true },
            inlayHints = { enable = true },
          },
          filetypes = {
            "ocaml",
            "ocaml.interface",
            "ocaml.menhir",
          },
        },
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      -- specify tools here
      local ensure_installed = {
        "stylua",
        "goimports",
      }

      require("mason").setup()
      require("mason-lspconfig").setup()
      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup { ensure_installed = ensure_installed }

      local lspconfig = require "lspconfig"
      local capabilities = nil
      if pcall(require, "nvim_cmp_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      local disable_semantic_tokens = {
        lua = true,
        zig = true,
        -- rust = true,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "invalid lsp client")

          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help)
          vim.keymap.set("n", "K", vim.lsp.buf.hover) -- set by default
          vim.keymap.set("n", "gd", vim.lsp.buf.definition)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
          vim.keymap.set("n", "gr", vim.lsp.buf.references)
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition)
          vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float) -- def is C-W [C-]d
          vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename)
          vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action)
          vim.keymap.set("n", "<leader>lf", function()
            require("conform").format { lsp_fallback = true }
          end)

          local ft = vim.bo[bufnr].filetype
          if disable_semantic_tokens[ft] then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      -- vim.diagnostic.config {
      --   virtual_text = true,
      --   signs = true,
      --   update_in_insert = false,
      --   underline = true,
      --   severity_sort = true,
      --   float = {
      --     border = float_border,
      --     source = true,
      --     focusable = true,
      --     header = "",
      --     prefix = "",
      --   },
      -- }
    end,
  },
}
