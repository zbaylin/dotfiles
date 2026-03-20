local neopyter = require("neopyter")
local wk = require("which-key")

neopyter.setup({
  mode = "direct",
  remote_address = "127.0.0.1:9001",
  file_pattern = { "*.ju.*" },
  on_attach = function(buf)
    wk.add({
      { "<leader>rc", "<CMD>Neopyter execute notebook:run-cell<CR>", desc = "Run cell", buffer = buf }
    })
  end
})
