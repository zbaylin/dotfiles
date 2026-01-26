local utils = require("utils")
local Export = {}

local on_attach_generic = function(wk, client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

Export.on_attach_generic = on_attach_generic

return Export
