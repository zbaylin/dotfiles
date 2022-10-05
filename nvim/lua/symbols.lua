require("symbols-outline").setup({
  fold_markers = { "+", "-" },
  symbols = {
    File = { icon = "📄" , hl = "TSURI" },
    Function = { icon = "λ", hl = "TSFunction" },
    Variable = { icon = "𝓍", hl = "TSConstant" },
    Number = { icon = "#", hl = "TSNumber" },
    Module = { icon = "📦", hl = "TSNamespace" },
    Namespace = { icon = "👾", hl = "TSNamespace" },
    Enum = { icon = "𝔼", hl = "TSType" },
    Class = { icon = "ℂ", hl = "TSType" },
    Property = { icon = "∙", hl = "TSMethod" },
    Interface = { icon = "𝕀", hl = "TSType" },
    Struct = { icon = "𝕊", hl = "TSType" },
    Object = { icon = "𝕆", hl = "TSType" },
    Key = { icon = "🔑", hl = "TSType" },
    Array = { icon = "ꔖ", hl = "TSConstant" },
    String = { icon = "〰", hl = "TSString" },
    Operator = { icon = "+", hl = "TSOperator" },
    Constructor = { icon = "🔨", hl = "TSConstructor" }
  }
})

vim.keymap.set("n", "<leader>o", "<Cmd>SymbolsOutline<CR>", { silent = true })
