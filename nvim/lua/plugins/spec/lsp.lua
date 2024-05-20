local float_border = require("compat").float_border_style
return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Useful status updates for LSP
      {
        "j-hui/fidget.nvim",
        opts = {
          progress = {
            display = {
              progress_icon = { pattern = "dots", period = 1 },
            },
          },
          notification = {
            override_vim_notify = true,
            view = {
              stack_upwards = true,
            },
            window = {
              winblend = 0,
              relative = "editor",
            },
          },
        },
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      -- { 'folke/neodev.nvim', config = function() require("neodev").setup {} end },
    },
    config = function()
      local on_attach = function(client, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          if not func then
            print("bad lsp map: " .. desc)
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, remap = false })
        end

        -- disable all semantic tokens
        -- client.server_capabilities.semanticTokensProvider = nil

        nmap("K", vim.lsp.buf.hover, "hover")
        -- TODO find out what this even is, prob just func sig help but it's never worked ???
        --nmap("<C-h>", vim.lsp.buf.signature_help, "signature help")
        nmap("<leader>ld", vim.diagnostic.open_float, "open float")
        -- TODO find decent replacements for these
        nmap("]d", vim.diagnostic.goto_prev, "prev diag")
        nmap("[d", vim.diagnostic.goto_next, "next diag")
        nmap("<leader>lrn", vim.lsp.buf.rename, "rename")
        nmap("<leader>lca", vim.lsp.buf.code_action, "code action")
        -- nmap("<leader>lf", vim.lsp.buf.format, "format")
        nmap("<leader>lf", function()
          require("conform").format { lsp_fallback = true }
        end, "format")
        nmap("<leader>lws", vim.lsp.buf.workspace_symbol, "workspace symbol")
        --nmap("<leader>lds", vim.lsp.buf.document_symbol, "document symbol")

        nmap("gd", vim.lsp.buf.definition, "go definition")
        nmap("gr", vim.lsp.buf.references, "go references")
        nmap("gI", vim.lsp.buf.implementation, "go implementations")
      end

      require("lspconfig.ui.windows").default_options.border = "rounded"
      require("mason").setup()
      require("mason-lspconfig").setup()

      local servers = {
        rust_analyzer = {
          cargo = {
            allFeatures = true,
          },
          imports = {
            group = {
              enable = true,
            },
          },
        },
        -- TODO: dont use mason
        -- gopls = {},
        lua_ls = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            -- diagnostics = {
            -- 	globals = { "vim" },
            -- },
            telemetry = { enable = false },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local mason_lspconfig = require "mason-lspconfig"
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
      }

      vim.diagnostic.config {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = float_border,
          focusable = true,
          header = "",
          prefix = "",
        },
        prefix = nil,
      }

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = float_border,
      })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = float_border })

      if vim.fn.executable "racket" then
        require("lspconfig").racket_langserver.setup {
          cmd = { "racket", "--lib", "racket-langserver" },
          filetypes = { "racket", "scheme" },
          --root_dir = ,
          single_file_support = true,
          on_attach = function(client, bufnr)
            vim.cmd [[iabbrev lambda λ]]
            on_attach(client, bufnr)
          end,
        }
      end

      require("lspconfig").ocamllsp.setup {
        cmd = { "ocamllsp", "--stdio" },
        filetypes = {
          "ocaml",
          "ocaml.menhir",
          "ocaml.interface",
          "ocaml.ocamllex",
          "reason",
          "dune",
        },
        on_attach = on_attach,
      }

      require("lspconfig").gopls.setup {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
        single_file_support = true,
        on_attach = on_attach,
      }

      require("lspconfig").zls.setup {
        on_attach = on_attach,
      }
    end,
  },
}
