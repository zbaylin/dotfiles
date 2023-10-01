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
