local lualine = require("lualine")

lualine.setup({
  options = {
    icons_enabled = false
  },
  sections = {
    lualine_b = {
      "branch",
      "diff",
      "diagnostics"
    },
    lualine_c = {
      { "filename", path = 1 }
    },
    lualine_x = {
      "filetype"
    },
    lualine_y = { {
      "aerial",
      sep = " > "
    } }
  }
})
