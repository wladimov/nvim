return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right", -- Muestra el panel a la derecha
      width = 30, -- Ancho del panel
    },
    filesystem = {
      --   follow_current_file = {
      --     enabled = true, -- El árbol sigue el archivo activo
      --   },
      -- hijack_netrw_behavior = "open_default", -- Se abre automáticamente

      filtered_items = {
        visible = true, -- Muestra todos los archivos ocultos y filtrados
        hide_dotfiles = false, -- Muestra archivos que comienzan con "."
        hide_gitignored = true, -- Muestra los ignorados por Git con estilo tenue
      },
    },
  },

  -- config = function(_, opts)
  --   require("neo-tree").setup(opts)
  --
  --   -- Estilo visual para archivos ignorados (transparencia visual)
  --   vim.cmd([[
  --     highlight NeoTreeDimText guifg=#5c6370 gui=italic
  --   ]])
  -- end,
}
