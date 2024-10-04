local gitsigns = require("gitsigns")
local wk = require("which-key")

gitsigns.setup()

wk.add({
  { "<leader>gb", gitsigns.toggle_current_line_blame, desc = "Toggle line git blame", mode = "n" }
})
