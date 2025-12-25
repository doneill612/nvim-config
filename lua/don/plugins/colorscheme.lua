local colorSchemes = {
	solarized_osaka = function()
		return {
			"craftzdog/solarized-osaka.nvim",
			lazy = false,
			priority = 1000,
			opts = function()
				return {
					transparent = false,
				}
			end,
			config = function(_, opts)
				require("solarized-osaka").setup(opts)
				vim.cmd([[colorscheme solarized-osaka]])
			end,
		}
	end,
	kanagawa = function(variant)
		return {
			"rebelot/kanagawa.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				local themeColor = require("kanagawa")
				themeColor.setup({
					compile = false,
					undercurl = true,
					commentStyle = { italic = true },
					keywordStyle = { italic = false, bold = true },
					transparent = false,
					theme = variant,
				})
				vim.cmd("colorscheme kanagawa")
				themeColor.load(variant)
			end,
		}
	end,
	miasma = function()
		return {
			"xero/miasma.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd("colorscheme miasma")
			end,
		}
	end,
	noctis = function(variant)
		return {
			"talha-akram/noctis.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd("colorscheme " .. (variant or "noctis"))
			end,
		}
	end,
	oxocarbon = function()
		return {
			"nyoom-engineering/oxocarbon.nvim",
			lazy = false,
			config = function()
				vim.cmd("colorscheme oxocarbon")
			end,
		}
	end,
}

return colorSchemes.oxocarbon()
