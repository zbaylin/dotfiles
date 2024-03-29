set number
syntax on

let mapleader = " "

call plug#begin()
Plug 'APZelos/blamer.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'RRethy/vim-illuminate'
Plug 'sainnhe/edge'
Plug 'dylon/vim-antlr'
Plug 'folke/neodev.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'knubie/vim-kitty-navigator', { 'do': 'cp ./*.py ~/.config/kitty/' }
Plug 'lervag/vimtex'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nmac427/guess-indent.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'projekt0n/github-nvim-theme'
Plug 'rcarriga/nvim-notify'
Plug 'ruanyl/vim-gh-line'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'stevearc/aerial.nvim'
Plug 'stevearc/oil.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'lervag/vimtex'
call plug#end()

set completeopt=menu,menuone,noselect

hi NonText guifg=bg

lua <<EOF
-- Local lua files
local utils = require("utils")
local set = require("set")
local remap = require("remap")
local commands = require("commands")
local autocmds = require("autocmds")
EOF
