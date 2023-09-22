set number
syntax on

let mapleader = " "

call plug#begin()
Plug 'APZelos/blamer.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'cocopon/iceberg.vim'
Plug 'dylon/vim-antlr'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'knubie/vim-kitty-navigator', { 'do': 'cp ./*.py ~/.config/kitty/' }
Plug 'lervag/vimtex'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'rcarriga/nvim-notify'
Plug 'ruanyl/vim-gh-line'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'simrat39/symbols-outline.nvim'
Plug 'stevearc/oil.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nmac427/guess-indent.nvim'
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
call plug#end()

set completeopt=menu,menuone,noselect

hi NonText guifg=bg

lua <<EOF
-- Local lua files
local utils = require('utils')
local symbols = require('symbols')
local set = require('set')
local remap = require('remap')
local lsp = require('lsp')
local commands = require('commands')
EOF
