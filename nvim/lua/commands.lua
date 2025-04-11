vim.api.nvim_create_user_command(
  "Root",
  function()
    local handle = io.popen("git root")
    local root = handle:read("*l")
    vim.cmd({
      cmd = "cd",
      args = { root }
    })
  end,
  {}
)

vim.api.nvim_create_user_command(
  "ScratchTab",
  function()
    vim.cmd({ cmd = "tabnew" })
    vim.cmd({ cmd = "set", args = { "buftype=nofile" }})
  end,
  {}
)

vim.api.nvim_create_user_command(
  "ScratchSplit",
  function()
    vim.cmd({ cmd = "new" })
    vim.cmd({ cmd = "set", args = { "buftype=nofile" }})
  end,
  {}
)

vim.api.nvim_create_user_command(
  "ScratchVSplit",
  function()
    vim.cmd({ cmd = "vnew" })
    vim.cmd({ cmd = "set", args = { "buftype=nofile" }})
  end,
  {}
)
