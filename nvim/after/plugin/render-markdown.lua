local render_markdown = require("render-markdown")

render_markdown.setup({
  completions = { lsp = { enabled = true } },
  file_types = { "markdown", "quarto", "codecompanion" },
  render_modes = { "n", "c", "t" },
  enabled = true,
})
