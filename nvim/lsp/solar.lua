local function strip_nil(diags)
  for _, d in ipairs(diags or {}) do
    for k, v in pairs(d) do
      if v == vim.NIL then d[k] = nil end
    end
  end
end

return {
  name = "Solar LSP",
  cmd = { "forge", "lsp" },
  filetypes = { "solidity" },
  root_markers = { "foundry.toml", ".git" },
  handlers = {
    ['textDocument/publishDiagnostics'] = function(err, result, ctx, config)
      if result then strip_nil(result.diagnostics) end
      return vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
    end,
    ['textDocument/diagnostic'] = function(err, result, ctx, config)
      if err and err.data == vim.NIL then
        err.data = nil
      end

      if result then strip_nil(result.items) end
      return vim.lsp.diagnostic.on_diagnostic(err, result, ctx, config)
    end,
  }
}
