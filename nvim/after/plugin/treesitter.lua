local treesitter_configs = require("nvim-treesitter.configs")
local treesitter_install = require("nvim-treesitter.install")

treesitter_install.compilers = { "gcc-mp-12", "clang" }

treesitter_configs.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "ocaml", "json" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  playground = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { "ocaml", "ocaml_interface" }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        [ "am" ] = "@module.outer",
        [ "im" ] = "@module.inner",

        [ "la" ] = "@assignment.lhs",
        [ "ra" ] = "@assignment.rhs",

        [ "ai" ] = "@conditional.outer",
        [ "ii" ] = "@conditional.inner",

        [ "ac" ] = "@comment.outer",
        [ "ic" ] = "@comment.inner"
      }
    }
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
