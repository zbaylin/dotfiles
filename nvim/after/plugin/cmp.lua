local cmp = require("cmp")
local luasnip = require("luasnip")
local luasnip_loaders_from_vscode = require("luasnip.loaders.from_vscode")
local utils = require("utils")

luasnip_loaders_from_vscode.lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    [ "<C-k>" ] = cmp.mapping.select_prev_item(),
    [ "<C-j>" ] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip", max_item_count = 3 },
    { name = "buffer", max_item_count = 3 }
  })
})
