-- Plugin: folke/which-key.nvim
-- URL: https://github.com/folke/which-key.nvim
-- Description: Plugin to show a popup with available keybindings.
-- IMPORTANT: using event "VeryLazy" to optimize loading time
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic",
    win = { border = "single" },
  },
}
