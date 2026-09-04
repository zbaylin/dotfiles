vim.o.number = true
vim.cmd.syntax("on")

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Build hooks. Registered before `vim.pack.add` so they also fire on install.
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind, path = ev.data.spec.name, ev.data.kind, ev.data.path
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "markdown-preview.nvim" then
      vim.system({ "yarn", "install" }, { cwd = path .. "/app" })
    end
  end,
})

local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  gh("3rd/image.nvim"),
  gh("L3MON4D3/LuaSnip"),
  gh("MeanderingProgrammer/render-markdown.nvim"),
  gh("RRethy/vim-illuminate"),
  gh("chomosuke/typst-preview.nvim"),
  gh("folke/flash.nvim"),      -- Navigation helpers
  gh("folke/which-key.nvim"),  -- Keybinding view
  gh("folke/snacks.nvim"),
  gh("hrsh7th/cmp-buffer"),
  gh("hrsh7th/cmp-cmdline"),
  gh("hrsh7th/cmp-nvim-lsp"),
  gh("hrsh7th/cmp-omni"),
  gh("hrsh7th/cmp-path"),
  gh("hrsh7th/nvim-cmp"),
  gh("iamcco/markdown-preview.nvim"),
  gh("j-hui/fidget.nvim"),     -- LSP status updates
  gh("jmbuhr/otter.nvim"),
  gh("kevinhwang91/nvim-ufo"), -- Fold helpers
  gh("kevinhwang91/promise-async"),
  gh("knubie/vim-kitty-navigator"),
  gh("lambdalisue/vim-suda"),  -- Edit files with sudo
  gh("mfussenegger/nvim-dap"),
  gh("mfussenegger/nvim-dap-python"),
  gh("mfussenegger/nvim-jdtls"),
  gh("neovim/nvim-lspconfig"),
  gh("nmac427/guess-indent.nvim"),
  gh("numToStr/Comment.nvim"),
  gh("nvim-lua/plenary.nvim"), -- Random stdlib stuff
  gh("nvim-lualine/lualine.nvim"),
  gh("nvim-neotest/nvim-nio"),
  gh("nvim-tree/nvim-web-devicons"),
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  { src = gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },
  gh("olimorris/codecompanion.nvim"),
  gh("pwntester/octo.nvim"),
  gh("rcarriga/nvim-dap-ui"),
  gh("saadparwaiz1/cmp_luasnip"),
  gh("sainnhe/sonokai"),
  gh("stevearc/aerial.nvim"),      -- Symbol outline
  gh("stevearc/oil.nvim"),         -- File explorer
  gh("stevearc/conform.nvim"),     -- Formatter
  gh("nosduco/remote-sshfs.nvim"), -- SSHFS
  gh("windwp/nvim-autopairs"),
})

vim.o.completeopt = "menu,menuone,noselect"

vim.cmd("hi NonText guifg=bg")

-- Local lua files
require("utils")
require("set")
require("remap")
require("commands")
require("autocmds")
require("windows")
require("rust_analyzer_ext")
