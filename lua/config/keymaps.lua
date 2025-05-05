-- Configuración de atajos personalizados
-- Estos atajos usan <leader> y se integran con which-key

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Archivo
map("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
map("n", "<leader>q", ":q<CR>", { desc = "Cerrar ventana" })

-- Navegación entre ventanas
map("n", "<C-h>", "<C-w>h", { desc = "Mover a la ventana izquierda" })
map("n", "<C-l>", "<C-w>l", { desc = "Mover a la ventana derecha" })
map("n", "<C-j>", "<C-w>j", { desc = "Mover a la ventana inferior" })
map("n", "<C-k>", "<C-w>k", { desc = "Mover a la ventana superior" })

-- Limpiar búsqueda
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Limpiar búsqueda" })

-- Buscar
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Buscar archivos" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Buscar texto (live grep)" })

-- Buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Siguiente buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer anterior" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Cerrar buffer" })

-- Árbol de archivos
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Explorador de archivos" })

-- Notificaciones con Snacks
map("n", "<leader>n", function()
  require("snacks").notifier.show_history()
end, { desc = "Historial de notificaciones" })

-- Registro de grupos para which-key
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  wk.register({
    ["<leader>b"] = { name = "+buffer" },
    ["<leader>f"] = { name = "+archivo" },
    ["<leader>g"] = { name = "+git" },
    ["<leader>n"] = { name = "+notificaciones" },
    ["<leader>s"] = { name = "+buscar" },
  })
end

