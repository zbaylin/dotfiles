local gitlinker = require("gitlinker")
local gitlinker_actions = require("gitlinker.actions")
local wk = require("which-key")

gitlinker.setup({ mappings = nil })

wk.add({
  { 
    "<leader>gh",
    function()
      local mode = string.lower(vim.api.nvim_get_mode().mode)
      gitlinker.get_buf_range_url(mode, { action_callback = gitlinker_actions.open_in_browser })
    end,
    desc = "Open link in GitHub",
    mode = { "n", "v" }
  },
  { 
    "<leader>gy",
    function()
      local mode = string.lower(vim.api.nvim_get_mode().mode)
      gitlinker.get_buf_range_url(mode, { action_callback = gitlinker_actions.copy_to_clipboard })
    end,
    desc = "Copy GitHub link to clipboard",
    mode = { "n", "v" }
  },
})
