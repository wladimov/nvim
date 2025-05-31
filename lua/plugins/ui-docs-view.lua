-- Plugin: nvim-docs-view
-- URL: https://github.com/amrbashir/nvim-docs-view
-- Description: A Neovim plugin for viewing documentation.
return {
  "amrbashir/nvim-docs-view",
  lazy = true,              -- Load this plugin lazily
  cmd = "DocsViewToggle",   -- Command to toggle the documentation view
  opts = {
    position = "right",     -- Position the documentation view on the right
    width = 60,             -- Set the width of the documentation view
  },
}
