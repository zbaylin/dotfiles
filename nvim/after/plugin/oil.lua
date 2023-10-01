local oil = require("oil")
local utils = require("utils")
local nnoremap = utils.nnoremap

oil.setup()

nnoremap("-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

