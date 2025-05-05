-- Tema Tokyonight
return {
  "folke/tokyonight.nvim",
  priority = 1000, -- Cargar antes que otros plugins
  config = function()
    vim.cmd.colorscheme("tokyonight")
  end,
}

