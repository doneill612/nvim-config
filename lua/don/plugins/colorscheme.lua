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
	kanagawa = function(themeName)
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
					keywordStyle = { italic = true, bold = true },
					transparent = false,
					theme = themeName,
				})
				vim.cmd("colorscheme kanagawa")
				themeColor.load(themeName)
			end,
		}
	end,
}

return colorSchemes.kanagawa("lotus")
