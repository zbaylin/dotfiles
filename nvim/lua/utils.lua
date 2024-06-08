local Export = {}

local function bind(op, outer_opts)
  outer_opts = vim.tbl_extend("force", { noremap = true, silent = true }, outer_opts or {})

  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local function dbg(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dbg(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

Export.map = bind("")
Export.nmap = bind("n", { noremap = false })
Export.vmap = bind("v", { noremap = false })
Export.nnoremap = bind("n")
Export.vnoremap = bind("v")
Export.xnoremap = bind("x")
Export.inoremap = bind("i")
Export.tnoremap = bind("t")
Export.dbg = dbg

return Export
