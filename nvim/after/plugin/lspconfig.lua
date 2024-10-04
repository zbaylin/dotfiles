local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local utils = require("utils")
local lsp_helpers = require("lsp_helpers")
local wk = require("which-key")

local vmap = utils.vmap

local on_attach_generic = function(client, bufnr) 
  lsp_helpers.on_attach_generic(wk, client, bufnr)
end

wk.add({
  { "]d", vim.diagnostic.goto_next, desc = "Goto next diagnostic", mode = "n" },
  { "[d", vim.diagnostic.goto_prev, desc = "Goto previous diagnostic", mode = "n" },
  {
    "<leader>f",
    function() vim.lsp.buf.format({ async = true }) end,
    desc = "Goto previous diagnostic",
    mode = "n"
  },
  {
    "<leader>e",
    function() vim.diagnostic.open_float({ scope = "line" }) end,
    desc = "Show diagnostic float",
    mode = "n"
  }
})

vmap("<leader>f", function() vim.lsp.buf.format({ async = true }) end)

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
  "gopls"
}

for _, lsp in pairs(default_lsps) do
  lspconfig[lsp].setup(default_setup)
end

lspconfig['ts_ls'].setup({
  on_attach = on_attach_ts,
  flags = default_flags,
  handlers = handlers,
  capabilities = default_capabilities,
})

local rust_analyzer_features_env = os.getenv("RUST_ANALYZER_FEATURES")
local rust_analyzer_features = {}

if rust_analyzer_features_env ~= nil and rust_analyzer_features_env ~= "" then
  local function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
      table.insert(result, each)
    end
    return result
  end
  rust_analyzer_features = split(rust_analyzer_features_env, ",")
end

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
      check = {
        features = rust_analyzer_features,
      },
      cargo = {
        features = rust_analyzer_features,
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

local clangd_query_driver = os.getenv("CLANGD_QUERY_DRIVER")
local clangd_cmd

if (clangd_query_driver ~= nil) then
  clangd_cmd = { "clangd", "--query-driver=" .. clangd_query_driver }
else
  clangd_cmd = { "clangd" }
end

lspconfig["clangd"].setup({
  on_attach = on_attach_generic,
  flags = default_flags,
  handlers = handlers,
  capabilities = default_capabilities,
  cmd = clangd_cmd,
})
