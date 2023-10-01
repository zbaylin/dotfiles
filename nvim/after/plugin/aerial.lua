local utils = require("utils")
local aerial = require("aerial")
local nnoremap = utils.nnoremap

aerial.setup({
  on_attach = function(bufnr)
    nnoremap("{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    nnoremap("}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  icons = {
    File = "☰",
    Function = "λ",
    Variable = "𝓍",
    Number = "#",
    Module = "Ⓜ",
    Constructor = "⊕"
  }
})

nnoremap("<leader>o", "<cmd>AerialToggle<CR>")
