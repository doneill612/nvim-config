return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	config = function()
		require("dressing").setup({
			input = {
				enabled = true,
				default_prompt = "Enter",
				trim_prompt = true,
				title_pos = "left",
				start_mode = "insert",
				border = "rounded",
				relative = "cursor",
			},
			select = {
				enabled = true,
				backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
				trim_propt = true,
				fzf = {
					window = {
						width = 0.5,
						height = 0.4,
					},
				},
			},
		})
	end,
}
