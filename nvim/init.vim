set number
syntax on

let mapleader = " "

call plug#begin()
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'lervag/vimtex'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'dylon/vim-antlr'
Plug 'cocopon/iceberg.vim'
Plug 'APZelos/blamer.nvim'
Plug 'ruanyl/vim-gh-line'
Plug 'simrat39/symbols-outline.nvim'
Plug 'knubie/vim-kitty-navigator', { 'do': 'cp ./*.py ~/.config/kitty/' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
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
