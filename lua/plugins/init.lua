return {

	-- Árbol de archivos
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- íconos para el árbol
		},
		config = function()
			require("nvim-tree").setup()
		end,
	},

	-- Treesitter para resaltado de sintaxis
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
			})
		end,
	},
}
