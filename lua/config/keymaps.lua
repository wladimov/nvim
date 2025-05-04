-- Define la tecla líder
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Navegación rápida con líder
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw (file explorer)" })

-- Guardar rápidamente
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Salir rápidamente
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Limpia la búsqueda
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
