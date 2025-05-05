-- Lualine: barra de estado inferior con modo, archivo, posición, etc.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Íconos decorativos en la barra
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",              -- Usa el esquema de colores activo
        section_separators = "",    -- Elimina los bordes de separación
        component_separators = "",  -- Elimina los separadores de componentes
      },
    })
  end,
}
