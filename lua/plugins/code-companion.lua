return {
  "olimorris/codecompanion.nvim",
  init = function()
    vim.cmd([[cab cc CodeCompanion]])
    require("plugins.codecompanion.codecompanion-notifier"):init()

    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanionInlineFinished",
      group = group,
      callback = function(request)
        vim.lsp.buf.format({ bufnr = request.buf })
      end,
    })
  end,
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI Toggle [C]hat" },
    { "<leader>an", "<cmd>CodeCompanionChat<cr>",        mode = { "n", "v" }, desc = "AI [N]ew Chat" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>",     mode = { "n", "v" }, desc = "AI [A]ction" },
    { "ga",         "<cmd>CodeCompanionChat Add<CR>",    mode = { "v" },      desc = "AI [A]dd to Chat" },
    -- prompts
    { "<leader>ae", "<cmd>CodeCompanion /explain<cr>",   mode = { "v" },      desc = "AI [E]xplain" },
  },
  config = true,
  opts = {
    adapters = {
      copilot_4o = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4o",
            },
          },
        })
      end,
      copilot_41 = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4.1",
            },
          },
        })
      end,
      copilot_gemini_25_pro = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gemini-2.5-pro",
            },
          },
        })
      end,
    },
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240,  -- Close an open chat buffer if the total columns of your display are less than...
        layout = "vertical",  -- vertical|horizontal split for default provider
        opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = "default", -- default|mini_diff
      },
      chat = {
        window = {
          position = "left",
        },
      },
    },
    strategies = {
      inline = {
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },
      chat = {
        slash_commands = {
          ["git_files"] = {
            description = "List git files",
            ---@param chat CodeCompanion.Chat
            callback = function(chat)
              local handle = io.popen("git ls-files")
              if handle ~= nil then
                local result = handle:read("*a")
                handle:close()
                chat:add_reference({ role = "user", content = result }, "git", "<git_files>")
              else
                return vim.notify("No git files available", vim.log.levels.INFO, { title = "CodeCompanion" })
              end
            end,
            opts = {
              contains_code = false,
            },
          },
        },
        keymaps = {
          send = {
            modes = { n = "<CR>", i = "<C-s>" },
          },
          close = {
            modes = { n = "<C-c>", i = "<C-c>" },
          },
          -- Add further custom keymaps here
        },
        adapter = "copilot",
        roles = {
          ---The header name for the LLM's messages
          ---@type string|fun(adapter: CodeCompanion.Adapter): string
          llm = function(adapter)
            return "AI (" .. adapter.formatted_name .. ")"
          end,

          ---The header name for your messages
          ---@type string
          user = "User",
        },
        tools = {
          groups = {
            ["full_stack_dev"] = {
              description = "Full Stack Developer - Can run code, edit code and modify files",
              system_prompt =
              "**DO NOT** make any assumptions about the dependencies that a user has installed. If you need to install any dependencies to fulfil the user's request, do so via the Command Runner tool. If the user doesn't specify a path, use their current working directory.",
              tools = {
                "cmd_runner",
                "editor",
                "files",
              },
            },
          },
          ["cmd_runner"] = {
            callback = "strategies.chat.agents.tools.cmd_runner",
            description = "Run shell commands initiated by the LLM",
            opts = {
              requires_approval = true,
            },
          },
          ["editor"] = {
            callback = "strategies.chat.agents.tools.editor",
            description = "Update a buffer with the LLM's response",
          },
          ["files"] = {
            callback = "strategies.chat.agents.tools.files",
            description = "Update the file system with the LLM's response",
            opts = {
              requires_approval = true,
            },
          },
        },
      },
    },
  },
}
