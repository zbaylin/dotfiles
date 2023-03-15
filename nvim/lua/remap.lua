-- Disable Q menu
vim.keymap.set("n", "Q", "<nop>")

-- Yank without overwriting default register
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader><leader>", function () 
  vim.cmd("so")
end)
