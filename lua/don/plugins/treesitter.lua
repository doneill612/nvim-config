return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({  -- Note: also "configs" not "config"
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "c",
        "query",
        "typescript",
        "javascript",
        "python",
        "go",
        "c_sharp"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = {
        enable = true,
        disable = { "python", "c" }
      }
    })
  end
}

