local codecompanion = require("codecompanion")
local codecompanion_adapters = require("codecompanion.adapters")
local codecompanion_helpers = require("codecompanion.adapters.acp.helpers")

codecompanion.setup({
  interactions = {
    chat = {
      adapter = {
        name = "claude_code"
      }
    }
  },
  adapters = {
    acp = {
      claude_code = function()
        return codecompanion_adapters.extend("claude_code", {
          commands = {
            default = { "npx", "@agentclientprotocol/claude-agent-acp" }
          },
          env = {
            CLAUDE_CODE_OAUTH_TOKEN = vim.env.CLAUDE_CODE_OAUTH_TOKEN
          }
        })
      end
    }
  }
})
