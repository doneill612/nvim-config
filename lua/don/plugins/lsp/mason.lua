return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"gopls",
				"omnisharp",
				"rust_analyzer",
			},
		})

		local mason_registry = require("mason-registry")
		local formatters = {
			"black",
			"prettier",
			"stylua",
			"gofumpt",
			"goimports",
			"csharpier",
		}

		for _, formatter in ipairs(formatters) do
			if not mason_registry.is_installed(formatter) then
				vim.cmd("MasonInstall " .. formatter)
			end
		end
	end,
}
