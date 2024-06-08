local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local utils = require("utils")
local lsp_helpers = require("lsp_helpers")

local nnoremap = utils.nnoremap
local vmap = utils.vmap
local on_attach_generic = lsp_helpers.on_attach_generic

nnoremap("]d", vim.diagnostic.goto_next)
nnoremap("[d", vim.diagnostic.goto_prev)
nnoremap("<leader>f", function() vim.lsp.buf.format({ async = true }) end)
vmap("<leader>f", function() vim.lsp.buf.format({ async = true }) end)
nnoremap("<leader>e", function() vim.diagnostic.open_float({ scope = "line" }) end)

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
}

local on_attach_ts = function(client, bufnr)
  local ts_utils = require("nvim-lsp-ts-utils")
  ts_utils.setup({})
  ts_utils.setup_client(client)

  on_attach_generic(client, bufnr)
end

local default_flags = { debounce_text_changes = 150 }

local default_capabilities = cmp_nvim_lsp.default_capabilities()

local default_setup = {
  on_attach = on_attach_generic,
  flags = default_flags,
  handlers = handlers,
  capabilities = default_capabilities,
}

local default_lsps = { "ocamllsp", "pyright", "solidity",
  "terraformls", "clangd", "html", "cssls", "jsonls",
}

for _, lsp in pairs(default_lsps) do
  lspconfig[lsp].setup(default_setup)
end

lspconfig['tsserver'].setup({
  on_attach = on_attach_ts,
  flags = default_flags,
  handlers = handlers,
  capabilities = default_capabilities,
})

lspconfig["rust_analyzer"].setup({
  on_attach = on_attach_generic,
  flags = default_flags,
  handlers = handlers,
  capabilities = default_capabilities,
  settings = {
    [ "rust-analyzer" ] = {
      imports = {
        granularity = {
          group = "module"
        },
        prefix = "self"
      },
      cargo = {
        buildScripts = {
          enable = true
        }
      },
      procMacro = {
        enable = true
      }
    }
  }
})

