local typst_preview = require("typst-preview")

typst_preview.setup({
  debug = true,
  dependencies_bin = {
    -- Assume both of these are installed.
    tinymist = vim.fn.exepath("tinymist"),
    websocat = vim.fn.exepath("websocat1")
  }
})
