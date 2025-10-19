return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local keymap = vim.keymap
			local gs = require("gitsigns")

			keymap.set("n", "]c", gs.next_hunk, { buffer = bufnr, desc = "Next hunk" })
			keymap.set("n", "[c", gs.prev_hunk, { buffer = bufnr, desc = "Previous hunk" })
			keymap.set("n", "<leader>hb", gs.blame_line, { buffer = bufnr, desc = "Git blame current line in buffer" })
		end,
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)

		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00" })
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffff00" })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000" })
		vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#00ffff" })
	end,
}
