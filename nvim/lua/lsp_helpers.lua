local utils = require("utils")
local Export = {}

local on_attach_generic = function(wk, client, bufnr)
  local telescope_builtin = require("telescope.builtin")

  local lsp_opts = {
    noremap = true,
    silent = true,
    buffer = bufnr } -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  wk.add({
    { "g", group = "goto" },
    { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
    { "gd", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" },
    { "K", vim.lsp.buf.hover, desc = "Open hover", mode = "n" },
    { "gi", vim.lsp.buf.implementation, desc = "Go to implementation", mode = "n" },
    { "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol", mode = "n" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Show code actions", mode = "n" },
    { "<leader>lr", telescope_builtin.lsp_references, desc = "List references", mode = "n" },
    { "<leader>td", telescope_builtin.lsp_type_definitions, desc = "List type definitions", mode = "n" },
    { "<leader>ld", telescope_builtin.diagnostics, desc = "List diagnostics", mode = "n" },
  })
end

Export.on_attach_generic = on_attach_generic

return Export
