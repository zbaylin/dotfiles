local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })

vim.api.nvim_create_autocmd(
  "VimResized",
  {
    group = wr_group,
    pattern = "*",
    command = "wincmd =",
    desc = "Auto-resize windows on terminal buffer resize."
  }
)
