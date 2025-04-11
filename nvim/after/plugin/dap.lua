local dap = require("dap")
local dap_python = require("dap-python")
local dapui = require("dapui")
local wk = require("which-key")

dapui.setup()

wk.add({
  { "<leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint", mode = "n" },
  { "<leader>dc", dap.continue, desc = "Continue", mode = "n" },
  { "<leader>dC", dap.run_to_cursor, desc = "Run to cursor", mode = "n" },
  { "<leader>dT", dap.terminate, desc = "Terminate", mode = "n" },
  { "<leader>du", function() dapui.toggle({}) end, desc = "Toggle DAP UI", mode = "n" },
  { "<leader>dso", dap.step_over, desc = "Step over", mode = "n" },
  { "<leader>dsi", dap.step_into, desc = "Step into", mode = "n" },
  { "<leader>dsO", dap.step_over, desc = "Step out", mode = "n" }
})

dap_python.setup("python3")
