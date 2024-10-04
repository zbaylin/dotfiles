local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local telescope = require("telescope")
local wk = require("which-key")

wk.add({
  { "<leader>f", group = "find" },
  { "<leader>ff", builtin.find_files, desc = "Find file", mode = "n" },
  { "<leader>fg", builtin.live_grep, desc = "Grep files", mode = "n" },
  { "<leader>fb", builtin.buffers, desc = "Find buffer", mode = "n" },
  { "<leader>fh", builtin.help_tags, desc = "Find help tags", mode = "n" },
  { "<leader>fd", builtin.diagnostics, desc = "Find diagnostics", mode = "n" },
  { "<leader>fr", builtin.registers, desc = "Find registers", mode = "n" },
  { "<leader>f?", builtin.oldfiles, desc = "Find old files", mode = "n" },
})

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
