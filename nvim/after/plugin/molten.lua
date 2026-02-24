local wk = require("which-key")

vim.g.molten_image_provider = "image.nvim"
vim.g.molten_output_win_max_height = 20

wk.add({
  { "<leader>oo", ":noautocmd MoltenEnterOutput<CR>", desc = "Open output window", mode = "n" },
  { "<leader>ob", ":noautocmd MoltenOpenInBrowser<CR>", desc = "Open in browser", mode = "n" },
  { "<leader>e", ":MoltenEvaluateOperator<CR>", desc = "Evaluate operator", mode = "n" },
  { "<leader>dc", ":MoltenDelete<CR>", desc = "Evaluate cell", mode = "n" },
})
