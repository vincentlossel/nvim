return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",

		"simrat39/rust-tools.nvim",
	},

	config = function()
		-- Base
		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")
		local lsp = require("lspconfig")

		-- Languages
		local rust_tools = require("rust-tools")

		-- Tools
		local cmp_lsp = require("cmp_nvim_lsp")

		local signs = {
			Error = "E",
			Warn = "W",
			Hint = "H",
			Info = "I",
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

		local servers = {
			"rust_analyzer",
			"tsserver",
			"yamlls",
			"pyright",
			"jsonls",
			"html",
			"cssls",
			"lua_ls",
			"dockerls",
			"tailwindcss",
			"gopls",
		}

		local server_settings = {
			["lua_ls"] = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
			["yamlls"] = {
				yaml = {
					keyOrdering = false,
				},
			},
		}

		-- Mason
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				}
			}
		})
		mason_lsp.setup({
			ensure_installed = servers,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp_lsp.default_capabilities(capabilities)

		-- Bindings
		local on_attach = function(_, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts)
			vim.keymap.set("n", "<Leader>dj", vim.diagnostic.goto_next, bufopts)
			vim.keymap.set("n", "<Leader>dk", vim.diagnostic.goto_prev, bufopts)
			vim.keymap.set("n", "<Leader>dl", "<Cmd>Telescope diagnostics<Cr>", bufopts)
			vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)

			-- Formatting
			vim.keymap.set("n", "<Leader>F", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>") -- Format on save
		end

		for _, server in pairs(servers) do
			if server == "rust_analyzer" then
				rust_tools.setup({ tools = { on_initialized = on_attach } })
			else
				lsp[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = server_settings[server],
				})
			end
		end
	end
}
