local utils = require("utils")
local aerial = require("aerial")
local wk = require("which-key")
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

wk.add({
  { "<leader>o", "<CMD>AerialToggle<CR>", desc = "Aerial toggle", mode = "n" }
})
