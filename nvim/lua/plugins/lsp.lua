local float_border = require("config.settings").float_border_style

return {
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			{
				'j-hui/fidget.nvim',
				opts = {
					progress = {
						display = {
							progress_icon = { pattern = "dots", period = 1 },
						},
					},
					notification = {
						override_vim_notify = false,
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
			-- 'folke/neodev.nvim',
		},
		config = function()
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc, })
				end

				nmap("K", vim.lsp.buf.hover, "hover")
				nmap("<C-h>", vim.lsp.buf.signature_help, "signature help")
				nmap("<leader>ld", vim.diagnostic.open_float, "open float")
				-- TODO find decent replacements for these
				--vim.keymap.set("n", "]d",          function() vim.diagnostic.goto_prev() end, opts)
				--vim.keymap.set("n", "[d",          function() vim.diagnostic.goto_next() end, opts)
				nmap("<leader>lrn", vim.lsp.buf.rename, "rename")
				nmap("<leader>lca", vim.lsp.buf.code_action, "code action")
				nmap("<leader>lf", vim.lsp.buf.format, "format")
				nmap("<leader>lws", vim.lsp.buf.workspace_symbol, "workspace symbol")
				--nmap("<leader>lds", vim.lsp.buf.document_symbol, "document symbol")

				nmap("gd", require("telescope.builtin").lsp_definitions, "go definition")
				nmap("gr", require("telescope.builtin").lsp_references, "go references")
				nmap("gI", require("telescope.builtin").lsp_implementations, "go implementations")
			end

			require("lspconfig.ui.windows").default_options.border = "rounded"
			require("mason").setup()
			require("mason-lspconfig").setup()

			local servers = {
				rust_analyzer = {},
				gopls = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						diagnostics = {
							globals = { "vim" }
						},
						telemetry = { enable = false }
					}
				}
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local mason_lspconfig = require "mason-lspconfig"
			mason_lspconfig.setup {
				ensure_installed = vim.tbl_keys(servers)
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
				-- TODO look into specific setup fror each server.
			}

			vim.diagnostic.config {
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = { border = float_border },
			}

			vim.lsp.handlers["textDocument/hover"] =
				vim.lsp.with(vim.lsp.handlers.hover, {
					border = float_border
				})
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signatureHelp, {
					border = float_border
				})
		end
	},
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
		config = function()
			local cmp = require "cmp"
			local luasnip = require "luasnip"
			-- TODO look into what this is, copied from kickstart
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup {}

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert {
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-e>'] = cmp.mapping.abort(),
					['<C-Space>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					},
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}
			}
		end
	},
}
