local gitlinker = require("gitlinker")
local gitlinker_actions = require("gitlinker.actions")
local wk = require("which-key")

gitlinker.setup({ mappings = nil })

wk.add({
  { 
    "<leader>gh",
    function()
      gitlinker.get_buf_range_url("n", { action_callback = gitlinker_actions.open_in_browser })
    end,
    desc = "Open link in GitHub",
    mode = "n"
  }
})
