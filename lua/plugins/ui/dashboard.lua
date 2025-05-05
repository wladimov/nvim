return {
  -- Plugin: snacks.nvim
  -- URL: https://github.com/folke/snacks.nvim/tree/main
  -- Descripción: Plugin para crear un dashboard (pantalla de inicio) personalizable en Neovim
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {}, -- Módulo para notificaciones visuales
      image = {}, -- Módulo opcional para mostrar imágenes (requiere Ueberzug o similar)
      picker = { -- Selector de archivos y opciones
        matcher = {
          fuzzy = true,        -- Permite coincidencia difusa (no exacta)
          smartcase = true,    -- Si el término tiene mayúsculas, la búsqueda distingue mayúsculas
          ignorecase = true,   -- Ignora mayúsculas si no hay mayúsculas en el término
          filename_bonus = true, -- Prioriza coincidencias en nombres de archivo
        },
        sources = {
          explorer = {
            matcher = {
              fuzzy = true,           -- Coincidencia difusa en explorador
              smartcase = true,       -- Respeta mayúsculas cuando hay mayúsculas
              ignorecase = true,      -- Ignora mayúsculas si no hay
              filename_bonus = true,  -- Prioriza coincidencia en nombres de archivo
              sort_empty = false,     -- Si no hay coincidencias, no ordena resultados vacíos
            },
          },
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Atajos de teclado", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Archivos recientes", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Proyectos", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          -- Texto ASCII de bienvenida (encabezado grande)
          header = [[
  ██╗    ██╗██╗      █████╗ ██████╗ ██╗███╗   ███╗ ██████╗ ██╗   ██╗
  ██║    ██║██║     ██╔══██╗██╔══██╗██║████╗ ████║██╔═══██╗██║   ██║
  ██║ █╗ ██║██║     ███████║██║  ██║██║██╔████╔██║██║   ██║██║   ██║
  ██║███╗██║██║     ██╔══██║██║  ██║██║██║╚██╔╝██║██║   ██║╚██╗ ██╔╝
╚███╔███╔╝███████╗██║  ██║██████╔╝██║██║ ╚═╝ ██║╚██████╔╝ ╚████╔╝
 ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝     ╚═╝ ╚═════╝   ╚═══╝
]],
          -- Atajos personalizados en la pantalla de inicio
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Buscar archivo", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "Nuevo archivo", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Buscar texto", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Archivos recientes", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config (nvim)", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restaurar sesión", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy (gestor de plugins)", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Salir", action = ":qa" },
          },
        },
      },
    },
  },
}

