local from_snipmate = require("luasnip.loaders.from_snipmate")
from_snipmate.lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })

