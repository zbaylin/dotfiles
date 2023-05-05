local Export = {}

local function bind(op, outer_opts)
  outer_opts = vim.tbl_extend("force", { noremap = true, silent = true }, outer_opts or {})

  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

Export.map = bind("")
Export.nmap = bind("n", { noremap = false })
Export.nnoremap = bind("n")
Export.vnoremap = bind("v")
Export.xnoremap = bind("x")
Export.inoremap = bind("i")
Export.tnoremap = bind("t")

return Export
