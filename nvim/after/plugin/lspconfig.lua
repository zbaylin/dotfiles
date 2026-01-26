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
    "<leader>e",
    function() vim.diagnostic.open_float({ scope = "line" }) end,
    desc = "Show diagnostic float",
    mode = "n"
  },
  { "g", group = "goto" },
  { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
  { "gd", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" },
  { "K", vim.lsp.buf.hover, desc = "Open hover", mode = "n" },
  { "gi", vim.lsp.buf.implementation, desc = "Go to implementation", mode = "n" },
  { "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol", mode = "n" },
  { "<leader>th", function()
    local enabled = vim.lsp.inlay_hint.is_enabled()

    if enabled then
      vim.notify("Disabling inlay hints")
    else
      vim.notify("Enabling inlay hints")
    end

    vim.lsp.inlay_hint.enable(not disabled)
  end, desc = "Toggle inlay hints", mode = "n"}
})


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
  capabilities = default_capabilities,
}

lspconfig_configs["solidity_ls_nomicfoundation"] = {
  default_config = {
    cmd = {'nomicfoundation-solidity-language-server', '--stdio'},
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}

vim.lsp.config("ts_ls", {
  on_attach = on_attach_ts,
  flags = default_flags,
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

vim.lsp.config("rust_analyzer", {
  flags = default_flags,
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
        command = "clippy"
      },
      cargo = {
        features = rust_analyzer_features,
        buildScripts = {
          enable = true
        }
      },
      inlayHints = {
        enable = true
      },
      procMacro = {
        enable = true
      },
      diagnostic = {
        refreshSupport = false
      },
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

vim.lsp.config("clangd", {
  on_attach = on_attach_generic,
  flags = default_flags,
  capabilities = default_capabilities,
  cmd = clangd_cmd,
})

vim.diagnostic.config({
  float = {
    source = "always"
  }
})

vim.lsp.enable({
  "pyrefly",
  "rust_analyzer",
  "ocamllsp",
  "terraformls",
  "clangd",
  "html",
  "cssls",
  "jsonls",
  "gopls",
  "solidity_ls_nomicfoundation" 
})

