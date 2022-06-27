local Export = {}

Export.save_and_build = function () 
  local ft = vim.api.nvim_buf_get_option(0, 'filetype')
  if ft == 'tex' then
    vim.cmd('VimtexCompile')
  end
end

return Export
