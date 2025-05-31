-- Plugin: incline.nvim
-- URL: https://github.com/b0o/incline.nvim
-- Description: A Neovim plugin for showing the current filename in a floating window.
return {
  "b0o/incline.nvim",
  event = "BufReadPre",   -- Load this plugin before reading a buffer
  priority = 1200,        -- Set the priority for loading this plugin
  config = function()
    require("incline").setup({
      window = { margin = { vertical = 0, horizontal = 1 } },   -- Set the window margin
      hide = {
        cursorline = true,                                      -- Hide the incline window when the cursorline is active
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")   -- Get the filename
        if vim.bo[props.buf].modified then
          filename = "[+] " ..
              filename   -- Indicate if the file is modified
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)   -- Get the icon and color for the file
        return { { icon, guifg = color }, { " " }, { filename } }                   -- Return the rendered content
      end,
    })
  end,
}
