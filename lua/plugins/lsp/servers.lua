-- Configuración de servidores LSP para múltiples lenguajes

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim", -- Gestor de LSPs
    "williamboman/mason-lspconfig.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "tsserver",      -- JavaScript / TypeScript
        "pyright",       -- Python
        "gopls",         -- Go
        "jsonls",        -- JSON
        "yamlls",        -- YAML
        "marksman",      -- Markdown
        "html",          -- HTML
        "cssls",         -- CSS
        "emmet_ls",      -- Emmet para HTML/CSS
        "lua_ls",        -- Lua
        "bashls",        -- Bash
      },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    -- Configuración base para todos
    local default_capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    local servers = {
      tsserver = {},
      pyright = {},
      gopls = {},
      jsonls = {},
      yamlls = {},
      marksman = {},
      html = {},
      cssls = {},
      emmet_ls = {},
      bashls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      },
    }

    for name, config in pairs(servers) do
      config.capabilities = default_capabilities
      lspconfig[name].setup(config)
    end
  end,
}

