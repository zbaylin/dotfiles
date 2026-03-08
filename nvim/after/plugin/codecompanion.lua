local codecompanion = require("codecompanion")
local codecompanion_adapters = require("codecompanion.adapters")
local codecompanion_helpers = require("codecompanion.adapters.acp.helpers")

codecompanion.setup({
  interactions = {
    chat = {
      adapter = {
        name = "cursor_cli"
      }
    }
  },
  adapters = {
    acp = {
      cursor_cli = function ()
        return {
          name = "cursor_cli",
          formatted_name = "Cursor CLI",
          type = "acp",
          roles = {
            llm = "assistant",
            user = "user"
          },
          commands = {
            default = { "agent", "acp" }
          },
          defaults = {
            mcpServers = {},
            timeout = 20000
          },
          parameters = {
            protocolVersion = 1,
            clientCapabilities = {
              fs = { readTextFile = true, writeTextFile = true },
            },
            clientInfo = {
              name = "CodeCompanion.nvim",
              version = "1.0.0",
            },
          },
          handlers = {
            setup = function(self)
              vim.notify("Launching Cursor CLI")
              return true
            end,

            auth = function(self)
              return true
            end,

            form_messages = function(self, messages, capabilities)
              return codecompanion_helpers.form_messages(self, messages, capabilities)
            end,

            on_exit = function(self, code) end,
          },
        }
      end
    }
  }
})
