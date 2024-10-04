local oil = require("oil")
local utils = require("utils")
local wk = require("which-key")

oil.setup()

wk.add({
  { "-", oil.open, desc = "Open parent directory", mode = "n" }
})

vim.api.nvim_create_user_command("OilToggleHidden", oil.toggle_hidden, {})
