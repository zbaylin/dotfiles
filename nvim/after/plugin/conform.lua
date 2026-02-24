local conform = require("conform")
local wk = require("which-key")


conform.setup({
  formatters_by_ft = {
    python = { "ruff_format", "black" },
    solidity = { "prettier" },
    rust = { "rustfmt" },
    cpp = { "clang-format" },
    html = { "html_beautify" },
    typescript = { "prettier" },
    tex = { "tex-fmt" }
  }
})

wk.add({
  { "<leader>f", conform.format, desc = "Format", mode = "n" }
})
