local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local utils = require("utils")
local nnoremap = utils.nnoremap

nnoremap("]d", vim.diagnostic.goto_next)
nnoremap("[d", vim.diagnostic.goto_prev)
nnoremap("<leader>f", function() vim.lsp.buf.format({ async = true }) end)

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
}

local on_attach_generic = function(client, bufnr)
  local lsp_opts = {
    noremap = true, 
    silent = true,
    buffer = bufnr
  }
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  nnoremap('gD', vim.lsp.buf.declaration, lsp_opts)
  nnoremap('gd', vim.lsp.buf.definition, lsp_opts)
  nnoremap('K', vim.lsp.buf.hover, lsp_opts)
  nnoremap('<leader>k', vim.lsp.buf.signature_help, lsp_opts)
  nnoremap('gi', vim.lsp.buf.implementation, lsp_opts)
  nnoremap('<leader>D', vim.lsp.buf.type_definition, lsp_opts)
  nnoremap('<leader>rn', vim.lsp.buf.rename, lsp_opts)
  nnoremap('<leader>ca', vim.lsp.buf.code_action, lsp_opts)
  nnoremap('gF', vim.lsp.buf.references, lsp_opts)

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

local on_attach_ts = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local ts_utils = require("nvim-lsp-ts-utils")
  ts_utils.setup({})
  ts_utils.setup_client(client)

  on_attach_generic(client, bufnr)
end

local default_flags = { debounce_text_changes = 150 }

lspconfig['ocamllsp'].setup ({
  on_attach = on_attach_generic,
  flags = default_flags,
  handlers = handlers
})

lspconfig['pyright'].setup({
  on_attach = on_attach_generic,
  flags = default_flags,
  handlers = handlers
})

lspconfig['tsserver'].setup({
  on_attach = on_attach_ts,
  flags = default_flags,
  handlers = handlers
})
