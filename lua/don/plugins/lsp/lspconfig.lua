return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local bufnr = ev.buf
				local opts = { buffer = bufnr, noremap = true, silent = true }

				opts.desc = "Restart language server"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

				opts.desc = "Go to definition"
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)

				opts.desc = "Go to implementation"
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)

				opts.desc = "Find references"
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)

				opts.desc = "Hover documentation"
				vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)

				opts.desc = "View code actions"
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Rename symbol"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show diagnostic info"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Previous diagnostic"
				vim.keymap.set("n", "[d", vim.diagnostic.jump, opts)
			end,
		})

		-- Rust
		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
						buildScripts = {
							enable = true,
						},
					},
					checkOnSave = true,
					procMacro = {
						enable = true,
					},
					inlayHints = {
						lifetimeElisionHints = {
							enable = "always",
						},
					},
				},
			},
		})

		-- Lua
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- TypeScript/JavaScript
		vim.lsp.config("ts_ls", {
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "all",
					},
				},
			},
		})

		-- Python
		vim.lsp.config("pyright", {
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "basic",
					},
				},
			},
		})

		-- Go
		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		})

		-- C#
		vim.lsp.config("omnisharp", {
			settings = {
				FormattingOptions = {
					EnableEditorConfigSupport = true,
					OrganizeImports = true,
				},
			},
		})

		-- Enable all servers
		vim.lsp.enable({
			"lua_ls",
			"ts_ls",
			"pyright",
			"gopls",
			"omnisharp",
			"rust_analyzer",
		})
	end,
}
