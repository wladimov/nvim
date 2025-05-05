-- Conform: aplica formato automático con herramientas externas
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Se activa antes de guardar archivos
  opts = {
    notify_on_error = true,
    format_on_save = { lsp_fallback = true }
      -- Desactiva formato automático solo en ciertos tipos de archivo
      local ignore_ft = { "markdown" }
      return not vim.tbl_contains(ignore_ft, vim.bo[bufnr].filetype)
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      go = { "gofmt" },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}

