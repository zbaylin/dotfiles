local wk = require("which-key")

wk.add(
  {
    "]u",
    function()
      vim.cmd("call search('[A-Z]', 'W')")
    end,
    desc = "Go to next capital letter",
    mode = "n"
  },
  {
    "[u",
    function()
      vim.cmd("call search('[A-Z]', 'b')")
    end,
    desc = "Go to previous capital letter",
    mode = "n"
  }
)
