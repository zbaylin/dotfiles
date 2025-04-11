local conform = require("conform")
local wk = require("which-key")


conform.setup({
  formatters_by_ft = {
    python = { "black" },
    solidity = { "forge_fmt" },
    rust = { "rustfmt" }
  }
})

wk.add({
  { "<leader>f", conform.format, desc = "Format", mode = "n" }
})
