local flash = require("flash")
local wk = require("which-key")

wk.add({
  { "<leader>ls", flash.jump, desc = "Flash", mode = { "n", "x", "o" } },
  { "<leader>lt", flash.treesitter, desc = "Flash + Treesitter", mode = { "n", "x", "o" } },
  { "<leader>lr", flash.treesitter_search, desc = "Flash + Treesitter (Search)", mode = { "n", "x", "o" } },
})
