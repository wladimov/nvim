-- Which-key: muestra atajos disponibles cuando presionas <leader>
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 1, 2, 1, 2 },
      },
      layout = {
        spacing = 6,
        align = "center",
      },
    })

    -- Registra grupos personalizados opcionales
    local wk = require("which-key")
    wk.register({
      ["<leader>f"] = { name = "+archivo" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>s"] = { name = "+buscar" },
      ["<leader>n"] = { name = "+notificaciones" },
    })
  end,
}

