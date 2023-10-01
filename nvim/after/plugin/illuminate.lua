local illuminate = require("illuminate")

illuminate.configure({
  under_cursor = false,
  providers = {
    "lsp",
    "treesitter"
  },
  filetypes_denylist = {
    "TelescopePrompt",
    "oil"
  }
})
