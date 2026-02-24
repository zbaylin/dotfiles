local quarto = require("quarto")
local runner = require("quarto.runner")
local wk = require("which-key")

quarto.setup({
  lspFeatures = {
    languages = { "python" },
    chunks = "all",
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" }
    },
    completion = { enabled = true }
  },
  codeRunner = {
    enabled = true,
    default_method = "molten"
  }
})

wk.add({
  { "<leader>rc", runner.run_cell, desc = "Run cell", silent = true }
})
