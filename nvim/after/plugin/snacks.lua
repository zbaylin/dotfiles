local snacks = require("snacks")
local wk = require("which-key")

snacks.setup({
  picker = { enabled = true }
})

wk.add({
  -- Files
  { "<leader>f", group = "find" },
  { "<leader>ff", snacks.picker.files, desc = "Find file", mode = "n" },
  { "<leader>fg", snacks.picker.grep, desc = "Grep files", mode = "n" },
  { "<leader>fr", snacks.picker.recent, desc = "Recent", mode = "n" },

  -- Buffers
  { "<leader>b", group = "find" },
  { "<leader>bl", snacks.picker.lines, desc = "Buffer lines", mode = "n" },

  -- LSP
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Show code actions", mode = "n" },
  { "<leader>lr", snacks.picker.lsp_references, desc = "List references", mode = "n" },
  { "<leader>td", snacks.picker.lsp_type_definitions, desc = "List type definitions", mode = "n" },
  { "<leader>ld", snacks.picker.diagnostics, desc = "List diagnostics", mode = "n" },
  { "<leader>ls", snacks.picker.lsp_symbols, desc = "List symbols", mode = "n" },
})
