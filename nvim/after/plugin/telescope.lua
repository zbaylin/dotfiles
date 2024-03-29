local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local telescope = require("telescope")
local nnoremap = require("utils").nnoremap

nnoremap("<leader>ff", builtin.find_files, {})
nnoremap("<leader>fg", builtin.live_grep, {})
nnoremap("<leader>fb", builtin.buffers, {})
nnoremap("<leader>fh", builtin.help_tags, {})
nnoremap("<leader>fd", builtin.diagnostics, {})
nnoremap("<leader>fr", builtin.registers, {})
nnoremap("<leader>?", builtin.oldfiles, {})

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

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
