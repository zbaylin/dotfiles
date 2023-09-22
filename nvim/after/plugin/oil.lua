local oil = require("oil")
local utils = require("utils")
local nnoremap = utils.nnoremap

oil.setup()

nnoremap("-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function ()
    local buffer_name = vim.api.nvim_buf_get_name(0)
    if string.match(buffer_name, "")
    then
    end
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" 
      and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" 
      and layout[3] == nil 
    then 
      vim.cmd("confirm quit") 
    end
  end
})

