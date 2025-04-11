local lualine = require("lualine")

lualine.setup({
  options = {
    icons_enabled = false,
    component_separators = {
      left = "|",
      right = "|"
    },
    section_separators = {
      left = "",
      right = ""
    },
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
  },
  tabline = {
    lualine_a = { "buffers" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_z = { "tabs" },
  }
})
