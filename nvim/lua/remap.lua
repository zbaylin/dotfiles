local utils = require("utils")
local nnoremap = utils.nnoremap

-- Disable Q menu
nnoremap("Q", "<nop>")

-- Reload config
nnoremap("<leader>sv", function()
  vim.cmd([[
    update $MYVIMRC
    source $MYVIMRC
  ]])
  vim.notify("Config reloaded.", vim.log.levels.INFO)
end, { silent = true })

-- Go to next & prev capital letter
nnoremap("]u", function()
  vim.cmd("call search('[A-Z]', 'W')")
end, { silent = true })

nnoremap("[u", function()
  vim.cmd("call search('[A-Z]', 'b')")
end, { silent = true })
