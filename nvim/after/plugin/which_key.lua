local wk = require("which-key")
local windows = require("windows")

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

wk.add({
  { "<leader>o", group = "Open"}, 
  { "<leader>f", group = "Find" },
  { "<leader>c", group = "Code" },
  { "<leader>b", group = "Buffer" },
  { "<leader>d", group = "Debugger" },
  { "<leader>g", group = "Git" },
  { "<leader>l", group = "List" },
  { "<leader>r", group = "Run" },
  { "<leader>w", group = "Window" },
  { "<leader>n", group = "Notification" },
  { "<leader>k", group = "Kill" },
  { "g", group = "Goto" },
  { "<leader>wm", windows.toggle_window_mode, desc = "Toggle window mode"}
})
