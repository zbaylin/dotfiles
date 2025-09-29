local conform = require("conform")
local wk = require("which-key")


conform.setup({
  formatters_by_ft = {
    python = { "black" },
    solidity = { "prettier" },
    rust = { "rustfmt" },
    cpp = { "clang-format" }
  }
})

wk.add({
  { "<leader>f", conform.format, desc = "Format", mode = "n" }
})
