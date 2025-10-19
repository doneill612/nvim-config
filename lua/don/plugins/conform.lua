return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    
    conform.setup({
      formatters_by_ft = {
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        lua = { "stylua" },
        go = { "gofumpt", "goimports" },
        csharp = { "csharpier" }
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500
      }
    })
  end
}
