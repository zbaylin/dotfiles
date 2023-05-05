local nvim_tree = require("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")
local utils = require("utils")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  update_focused_file = {
    enable = true
  },
  renderer = {
    icons = {
      glyphs = {
        default = "≡",
        symlink = "~>",
        folder = {
          arrow_closed = "▷",
          arrow_open = "▽",
          default = "/",
          open = "/*",
          empty = "·",
          empty_open = "…"
        }
      }
    }
  },
  actions = {
    expand_all = {
      exclude = { "node_modules", "_opam", ".git", ".github", "_build" }
    }
  }
})

utils.nnoremap("<C-b>", nvim_tree_api.tree.toggle)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function ()
    local buffer_name = vim.api.nvim_buf_get_name(0)
    if not (string.match(buffer_name, "COMMIT_EDITMSG") 
      or string.match (buffer_name, "MERGE_MSG")
      or string.match (buffer_name, "git-rebase-todo")) 
    then
      nvim_tree_api.tree.open()
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

