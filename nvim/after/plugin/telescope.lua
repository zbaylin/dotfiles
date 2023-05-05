local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local telescope = require("telescope")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>?", builtin.oldfiles, {})

telescope.setup({
  defaults = {
    mappings = {
      i = {
        [ "<C-k>" ] = actions.move_selection_previous,
        [ "<C-j>" ] = actions.move_selection_next,
      }
    }
  }
})

pcall(telescope.load_extension, "fzf")
