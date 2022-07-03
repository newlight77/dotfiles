-- PLUGINS
local fn = vim.fn

-- Automatically install packer
-- stdpath : ~/.local/share/nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Have packer use a popup window
packer.init {
  display = {
    auto_clean = true,
    compile_on_sync = true,
    disable_commands = true,
    git = { clone_timeout = 6000 },
    -- display = {
    working_sym = "ﲊ",
    error_sym = "✗",
    done_sym = "﫟",
    removed_sym = "",
    moved_sym = "",
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
    -- }
  },
}

-- vim.api.nvim_exec(
--   [[
--   augroup Packer
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]],
--   false
-- )

-- local use = require('packer').use
-- require('packer').startup(function()

-- Install your plugins here
return packer.startup(function(use)

  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Speed up loading Lua modules in Neovim to improve startup time.
  use "lewis6991/impatient.nvim"

  -- displays a popup with possible key bindings of the command you started typing
  use { "folke/which-key.nvim", config = function() require("plugs.whichkey") end }

  --  fast and fully customizable greeter for neovim.
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require('alpha').setup(require'alpha.themes.startify'.config)
        require('plugs.alpha')
    end
  }


  -- QuickFix
  use { 'folke/trouble.nvim' }

  -- An implementation of the Popup API from vim in Neovim
  use { "nvim-lua/popup.nvim", requires = { 'nvim-lua/plenary.nvim' } }

  -- Navigation and fuzzy search
  -- File Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-media-files.nvim', after = telescope }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- type 's' to search instead of '/'
  use { 'ggandor/lightspeed.nvim' }

  -- Fancier statusline
  -- use 'itchyny/lightline.vim'
  use { 'hoob3rt/lualine.nvim', 
    requires = {'kyazdani42/nvim-web-devicons', 
    opt = true }, 
    config = function() require('plugs.lualine') end }

  -- persist and toggle multiple terminals during an editing session
  use "akinsho/toggleterm.nvim"

  -- project management
  use "ahmedkhalf/project.nvim"

  -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-autopairs", config = function() require('plugs.autopairs') end }
  use { "akinsho/bufferline.nvim", requires = 'kyazdani42/nvim-web-devicons', config = function() require('plugs.bufferline') end }


  -- Easily comment stuff
  use { 'numToStr/Comment.nvim', config = function() require('plugs.comment') end }
  -- "gc" to comment visual regions/lines
  -- use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  -- adds indentation guides to all lines (including empty lines).
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugs.indent-blankline') end }



  -- Git commands in nvim
  use 'tpope/vim-fugitive'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function() require('plugs.gitsigns') end }

  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
  use { 'kyazdani42/nvim-web-devicons', after = "plenary.nvim", config = function() require('plugs.devicons') end }
  use { 'norcalli/nvim-colorizer.lua', config = function() require('plugs.colorizer') end}
  use { 'simrat39/symbols-outline.nvim', config =  function() require('plugs.symbols-outline') end }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter' }
  -- Additional textobjects for treesitter : Syntax aware text-objects, select, move, swap, and peek support.
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }


  -- completion
  use { 'hrsh7th/nvim-cmp', config = function() require('plugs.cmp') end }
  -- buffer completions
  use { "hrsh7th/cmp-buffer", after = 'nvim-cmp' }
  -- path completions
  use { "hrsh7th/cmp-path", after = 'nvim-cmp' }
  -- cmdline completions
  use { "hrsh7th/cmp-cmdline", after = 'nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }
  -- completion for lsp 
  use 'hrsh7th/cmp-nvim-lsp'
  use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }


  -- Snippets
  use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp', config = function() require('plugs.snippets') end }
  -- a bunch of snippets to use
  use { "rafamadriz/friendly-snippets", after = 'nvim-cmp' }

  
  -- LSP
  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  -- simple to use language server installer
  use { "williamboman/nvim-lsp-installer", config = function() require('plugs.lsp.init') end }
  -- hover highlights similar words
  use 'RRethy/vim-illuminate'
  -- hook external sourcers into inbuilt lsp( for formatters, linters, etc)
  use { "jose-elias-alvarez/null-ls.nvim", config = function() require('plugs.lsp.null-ls') end }
  -- language server settings defined in json for
  use "tamago324/nlsp-settings.nvim"


  -- Colorschemes
  -- Theme inspired by Atom
  use 'joshdick/onedark.vim'
  use 'bluz71/vim-moonfly-colors'
  --use 'tanvirtin/monokai.nvim'
  -- use 'folke/tokyonight.nvim'
  -- use "lunarvim/darkplus.nvim"



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)