return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", lsp_format = "fallback" },
        javascriptreact = { "prettier", lsp_format = "fallback" },
        typescript = { "prettier", lsp_format = "fallback" },
        typescriptreact = { "prettier", lsp_format = "fallback" },
        json = { "prettier", stop_on_first = true, lsp_format = "prefer" },
        jsonc = { "prettier", stop_on_first = true, lsp_format = "prefer" },
        rust = { name = "rust_analyzer", lsp_format = "prefer" },
        scss = { "prettier" },
        css = { "prettier" },
        sh = { "shfmt" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
