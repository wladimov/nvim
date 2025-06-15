return {
  "echasnovski/mini.move", -- Plugin mini.move
  version = false, -- Usar la rama principal (última versión)
  event = "VeryLazy", -- Cargar solo cuando sea necesario
  config = function()
    require("mini.move").setup() -- Configuración mínima (usa valores por defecto)
  end,
}
