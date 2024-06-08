local gitsigns = require("gitsigns")
local nnoremap = require("utils").nnoremap

gitsigns.setup()


nnoremap("<leader>gb", gitsigns.toggle_current_line_blame)
