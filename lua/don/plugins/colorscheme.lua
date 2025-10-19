return {
  {
    "ellisonleao/gruvbox.nvim",  -- Added .nvim suffix
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = false,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true,
        contrast = "soft",
        palette_overrides = {},
        overrides = {},
        dim_inactive = true,  -- Also fixed typo: "inactivte" -> "inactive"
        transparent_mode = false,
      })
      vim.cmd("colorscheme gruvbox")
    end
  }
}
