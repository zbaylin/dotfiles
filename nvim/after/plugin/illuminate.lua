local illuminate = require("illuminate")

illuminate.configure({
  under_cursor = false,
  providers = {
    "lsp",
    "treesitter"
  },
  filetypes_denylist = {
    "snacks_picker_input",
    "oil"
  }
})
