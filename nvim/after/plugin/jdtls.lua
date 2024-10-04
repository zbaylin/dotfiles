local jdtls = require("jdtls")
local jdtls_setup = require("jdtls.setup")
local lsp_helpers = require("lsp_helpers")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local wk = require("which-key")
local utils = require("utils")

local on_attach_generic = function(client, bufnr) 
  lsp_helpers.on_attach_generic(wk, client, bufnr)
end

local home = os.getenv("HOME")

local jdtls_config_file = io.open(home .. "/.jdtls.json")

local jdtls_config = nil

if jdtls_config_file ~= nil then
  local content = jdtls_config_file:read("*a")
  jdtls_config_file:close()
  jdtls_config = vim.json.decode(content)
end

if jdtls_config ~= nil then
  local jdtls_path = jdtls_config.jdtls_path
  local system = "mac" -- TODO:  make this configurable
  local config_path = vim.fn.glob(jdtls_path .. "/config_" .. system)
  local equinox_launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

  local extendedClientCapabilities = jdtls.extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true


  local root_dir = vim.fn.fnamemodify(jdtls_setup.find_root({ "gradlew", "build.gradle", "settings.gradle" }), ":p")
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
  local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

  local config = {
    cmd = {
      vim.fn.expand(jdtls_config.java_home .. "/bin/java"),
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",

      "-javaagent:" .. jdtls_config.lombok_path,

      "-jar",
      equinox_launcher_path,

      "-configuration",
      config_path,

      "-data",
      workspace_dir
    },

    root_dir = root_dir,

    capabilities = cmp_nvim_lsp.default_capabilities(),

    settings = {
      java = {
        server = { launchMode = "Hybrid" },
        eclipse = { downloadSources = true },
        maven = { downloadSources = true },
        references = { includeDecompiledSources = true },
        implementationsCodeLens = { enabled = false },
        referenceCodeLens = { enabled = false },
        signatureHelp = {
          enabled = true,
          description = {
            enabled = true
          }
        },
        inlayHints = {
          parameterNames = {
            enabled = "all"
          }
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          }
        },
        configuration = {
          runtimes = jdtls_config.runtimes
        },
      },
    },
    init_options = {
      bundles = {},
      extendedClientCapabilities = capabilities
    },
    on_attach = on_attach_generic
  }

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
      vim.cmd("set shiftwidth=4 tabstop=4")
      jdtls.start_or_attach(config)
    end
  })

end
