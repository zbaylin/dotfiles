set number
syntax on

let mapleader = " "

call plug#begin()
Plug 'L3MON4D3/LuaSnip'
Plug 'RRethy/vim-illuminate'
Plug 'f-person/auto-dark-mode.nvim'
Plug 'folke/flash.nvim' " Navigation helpers
Plug 'folke/which-key.nvim' " Keybinding view
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'j-hui/fidget.nvim' " LSP status updates
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'kevinhwang91/nvim-ufo' " Fold helpers
Plug 'kevinhwang91/promise-async'
Plug 'knubie/vim-kitty-navigator', { 'do': 'cp ./*.py ~/.config/kitty/' }
Plug 'lervag/vimtex'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'neovim/nvim-lspconfig'
Plug 'nmac427/guess-indent.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim' " Random stdlib stuff
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'rcarriga/nvim-notify'
Plug 'rebelot/kanagawa.nvim'
Plug 'rmagatti/goto-preview'
Plug 'ruifm/gitlinker.nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'stevearc/aerial.nvim' " Symbol outline
Plug 'stevearc/oil.nvim' " File explorer
Plug 'windwp/nvim-autopairs'
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
local windows = require("windows")
EOF
