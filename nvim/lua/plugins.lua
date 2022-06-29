-- PLUGINS

-- Install packer.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'
  -- "gc" to comment visual regions/lines
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

  -- Git commands in nvim
  use 'tpope/vim-fugitive'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
  -- Theme inspired by Atom
  use 'joshdick/onedark.vim'
  use 'bluz71/vim-moonfly-colors'
  use 'tanvirtin/monokai.nvim'
  -- Fancier statusline
  use 'itchyny/lightline.vim'


  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter' }
  -- Additional textobjects for treesitter : Syntax aware text-objects, select, move, swap, and peek support.
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- File Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- Autocompletion engin plugin
  use { 'hrsh7th/nvim-cmp', config = function() require('config.cmp') end }
  use { 'saadparwaiz1/cmp_luasnip' }
  -- Snippets plugin
  use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp', config = function() require('plugs.snippets') end }
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  -- completion for lsp 
  use 'hrsh7th/cmp-nvim-lsp'

  -- use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  -- use 'hrsh7th/nvim-cmp' -- Autocompletion engin plugin
  -- use 'hrsh7th/cmp-nvim-lsp' -- completion for lsp 
  -- use 'saadparwaiz1/cmp_luasnip'
  -- use 'L3MON4D3/LuaSnip' -- Snippets plugin

end)