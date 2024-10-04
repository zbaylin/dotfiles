local utils = require("utils")
local goto_preview = require("goto-preview")
local wk = require("which-key")

goto_preview.setup({})

wk.add({
  { "gpd", goto_preview.goto_preview_definition, desc = "Preview definition", mode = "n" }
})
