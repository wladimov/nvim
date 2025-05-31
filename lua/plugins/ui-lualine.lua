-- Plugin: lualine.nvim
-- URL: https://github.com/nvim-lualine/lualine.nvim
-- Description: A blazing fast and easy to configure Neovim statusline plugin.
local mode = {
  "mode",
  fmt = function(s)
    local mode_map = {
      ["NORMAL"] = "N",
      ["O-PENDING"] = "N?",
      ["INSERT"] = "I",
      ["VISUAL"] = "V",
      ["V-BLOCK"] = "VB",
      ["V-LINE"] = "VL",
      ["V-REPLACE"] = "VR",
      ["REPLACE"] = "R",
      ["COMMAND"] = "!",
      ["SHELL"] = "SH",
      ["TERMINAL"] = "T",
      ["EX"] = "X",
      ["S-BLOCK"] = "SB",
      ["S-LINE"] = "SL",
      ["SELECT"] = "S",
      ["CONFIRM"] = "Y?",
      ["MORE"] = "M",
    }
    return mode_map[s] or s
  end,
}

local function codecompanion_adapter_name()
  local chat = require("codecompanion").buf_get_chat(vim.api.nvim_get_current_buf())
  if not chat then
    return nil
  end

  return " " .. chat.adapter.formatted_name
end

local function codecompanion_current_model_name()
  local chat = require("codecompanion").buf_get_chat(vim.api.nvim_get_current_buf())
  if not chat then
    return nil
  end

  return chat.settings.model
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",                                       -- Load this plugin on the 'VeryLazy' event
  requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
  opts = {
    options = {
      theme = "auto",       -- Let Lualine pick up the active colorscheme
      icons_enabled = true, -- Enable icons in the statusline
    },
    sections = {
      lualine_a = {
        {
          "mode", -- Display the current mode
          icon = "", -- Set the icon for the mode
        },
      },
    },
    extensions = {
      "quickfix",
      {
        filetypes = { "oil" },
        sections = {
          lualine_a = {
            mode,
          },
          lualine_b = {
            function()
              local ok, oil = pcall(require, "oil")
              if not ok then
                return ""
              end

              ---@diagnostic disable-next-line: param-type-mismatch
              local path = vim.fn.fnamemodify(oil.get_current_dir(), ":~")
              return path .. " %m"
            end,
          },
        },
      },
      {
        filetypes = { "codecompanion" },
        sections = {
          lualine_a = {
            mode,
          },
          lualine_b = {
            codecompanion_adapter_name,
          },
          lualine_c = {
            codecompanion_current_model_name,
          },
          lualine_x = {},
          lualine_y = {
            "progress",
          },
          lualine_z = {
            "location",
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {
            codecompanion_adapter_name,
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {
            "progress",
          },
          lualine_z = {},
        },
      },
    },
  },
}
