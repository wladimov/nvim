-- Treesitter: resaltado de sintaxis y análisis estructural del código
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "go",
      "javascript",
      "typescript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "yaml",
      "html",
      "css",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    auto_install = true,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

