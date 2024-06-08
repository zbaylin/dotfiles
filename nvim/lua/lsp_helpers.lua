local utils = require("utils")
local nnoremap = utils.nnoremap
local Export = {}

local on_attach_generic = function(client, bufnr)
  local telescope_builtin = require("telescope.builtin")

  local lsp_opts = {
    noremap = true,
    silent = true,
    buffer = bufnr } -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  nnoremap('gD', vim.lsp.buf.declaration, lsp_opts)
  nnoremap('gd', vim.lsp.buf.definition, lsp_opts)
  nnoremap('K', vim.lsp.buf.hover, lsp_opts)
  nnoremap('gi', vim.lsp.buf.implementation, lsp_opts)
  nnoremap('<leader>D', vim.lsp.buf.type_definition, lsp_opts)
  nnoremap('<leader>rn', vim.lsp.buf.rename, lsp_opts)
  nnoremap('<leader>ca', vim.lsp.buf.code_action, lsp_opts)
  nnoremap('<leader>lr', function() telescope_builtin.lsp_references() end, lsp_opts)
  nnoremap('<leader>td', function() telescope_builtin.lsp_type_definitions() end, lsp_opts)

  if client.server_capabilities.codeLensProvider then
    local codelens = vim.api.nvim_create_augroup(
      "LSPCodeLens",
      { clear = true }
    )
    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CursorHold" }, {
      group = codelens,
      callback = vim.lsp.codelens.refresh,
      buffer = bufnr
    })
  end
end

Export.on_attach_generic = on_attach_generic

return Export
