local utils = require("utils")

local in_window_mode = false

local function set_window_mode()
  print("Entering window mode")
  utils.nmap("h", ":vertical resize -2<CR>")
  utils.nmap("j", ":resize +2<CR>")
  utils.nmap("k", ":resize -2<CR>")
  utils.nmap("l", ":vertical resize +2<CR>")
end

local function unset_window_mode()
  print("Leaving window mode")
  vim.keymap.del("n", "h")
  vim.keymap.del("n", "j")
  vim.keymap.del("n", "k")
  vim.keymap.del("n", "l")
end

local function toggle_window_mode()
  if in_window_mode then
    unset_window_mode()
  else 
    set_window_mode()
  end
  in_window_mode = not in_window_mode
end

utils.nnoremap("<leader>wm", toggle_window_mode)
