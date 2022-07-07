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

  -- Useful lua functions used by lots of plugins
  use "nvim-lua/plenary.nvim"

  use { 'kyazdani42/nvim-web-devicons', requires = "plenary.nvim", config = function() require('plugs.devicons') end }

  --  fast and fully customizable greeter for neovim.
  use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = function () require('plugs.alpha') end }

  -- diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = function() require("plugs.trouble") end }

  -- An implementation of the Popup API from vim in Neovim
  use { "nvim-lua/popup.nvim", requires = { 'nvim-lua/plenary.nvim' } }

  -- Super fast buffer jump
  use {
    'phaazon/hop.nvim',
    event = "VimEnter",
    config = function()
      vim.defer_fn(function() require('plugs.nvim-hop') end, 2000)
    end
  }

  -- Navigation and fuzzy search
  -- File Explorer
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = function() require('plugs.nvim-tree') end }
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim', 'folke/trouble.nvim' }, config = function() require('plugs.telescope') end }
  use { 'nvim-telescope/telescope-media-files.nvim', after = telescope }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- search emoji and other symbols
  use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}
  -- type 's' to search instead of '/'
  use { 'ggandor/lightspeed.nvim' }
  -- Show match number and index for searching
  use {
    'kevinhwang91/nvim-hlslens',
    branch = 'main',
    keys = {{'n', '*'}, {'n', '#'}, {'n', 'n'}, {'n', 'N'}},
    config = [[require('plugs.hlslens')]]
  }

  -- Fancier statusline
  -- use 'itchyny/lightline.vim'
  use { 'hoob3rt/lualine.nvim', 
    requires = {'kyazdani42/nvim-web-devicons', 
    opt = true }, 
    config = function() require('plugs.lualine') end }

  -- persist and toggle multiple terminals during an editing session
  -- use "akinsho/toggleterm.nvim"
  use { "NvChad/nvterm", module = "nvterm", config = function() require "plugs.nvterm" end }

  -- project management
  -- use "ahmedkhalf/project.nvim"

  -- notification plugin
  use {
    "rcarriga/nvim-notify",
    event = "BufEnter",
    config = function()
      vim.defer_fn(function() require('plugs.nvim-notify') end, 2000)
    end
  }

  -- distraction free with zen mode
  use {'folke/zen-mode.nvim', cmd = 'ZenMode', config = [[require('plugs.zen-mode')]]}

  -- Smoothie motions
  use {
    "karb94/neoscroll.nvim",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function() require('plugs.neoscroll') end, 2000)
    end
  }

  -- use { 'mvllow/modes.nvim', config = function() require('plugs.modes').setup() end })

  -- Debugger plugin
  -- if vim.g.is_win or vim.g.is_linux then
  --   use({ "sakhnik/nvim-gdb", run = { "bash install.sh" }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] })
  -- end
  use 'nvim-telescope/telescope-dap.nvim'
  use { 'mfussenegger/nvim-dap', config = function() require('plugs.nvim-dap') end }
  use { 'mfussenegger/nvim-dap-python', config = function() require('plugs.nvim-dap-python') end }

  -- The missing auto-completion for cmdline!
  use({"gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]]})

  -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-autopairs", config = function() require('plugs.autopairs') end }
  -- use { "akinsho/bufferline.nvim", requires = 'kyazdani42/nvim-web-devicons', config = function() require('plugs.bufferline') end }


  -- Easily comment stuff
  use { 'numToStr/Comment.nvim', config = function() require('plugs.comment') end }
  -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround'
  -- adds indentation guides to all lines (including empty lines).
  use { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugs.indent-blankline') end }
  -- show and trim trailing whitespaces
  use {'jdhao/whitespace.nvim', event = 'VimEnter'}


  -- Git commands in nvim
  use { 'TimUntersberger/neogit', requires = {'plenary.nvim'}, config = function() require('plugs.neogit') end }
  use 'tpope/vim-fugitive'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function() require('plugs.gitsigns') end }

  use { 'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'} }
  -- use { 'kyazdani42/nvim-web-devicons', after = "plenary.nvim", config = function() require('plugs.devicons') end }
  use { 'norcalli/nvim-colorizer.lua', config = function() require('plugs.colorizer') end}
  use { 'simrat39/symbols-outline.nvim', config =  function() require('plugs.symbols-outline') end }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter', config = function() require('plugs.treesitter') end }
  -- Additional textobjects for treesitter : Syntax aware text-objects, select, move, swap, and peek support.
  use { 'nvim-treesitter/nvim-treesitter-textobjects', config = function() require('plugs.treesitter-textobjects') end }


  -- completion
  use { 'hrsh7th/nvim-cmp', config = function() require('plugs.cmp') end }
  -- buffer completions
  use { "hrsh7th/cmp-buffer", requires = 'nvim-cmp' }
  -- path completions
  use { "hrsh7th/cmp-path", requires = 'nvim-cmp' }
  -- cmdline completions
  use { "hrsh7th/cmp-cmdline", requires = 'nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', requires = 'nvim-cmp' }
  -- completion for lsp 
  use 'hrsh7th/cmp-nvim-lsp'
  use { 'hrsh7th/cmp-nvim-lua', requires = 'nvim-cmp' }


  -- Snippets
  use { 'L3MON4D3/LuaSnip', requires = 'nvim-cmp', config = function() require('plugs.snippets') end }
  -- a bunch of snippets to use
  use { "rafamadriz/friendly-snippets", requires = 'nvim-cmp' }


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
  use { "glepnir/lspsaga.nvim", config = function() require("plugs.lspsaga") end }


  use { 'iamcco/markdown-preview.nvim' }

  -- Colorschemes
  -- Theme inspired by Atom
  -- use { 'joshdick/onedark.vim', config = function() require('plugs.themes.onedark').load() end }
  use { 'folke/tokyonight.nvim', config = function() require('plugs.themes.tokyonight') end }
  -- use { 'bluz71/vim-moonfly-colors', config = function() require('plugs.themes.moonfly') end }
  -- use 'tanvirtin/monokai.nvim'
  -- use "lunarvim/darkplus.nvim"
  -- use "EdenEast/nightfox.nvim"
  -- use 'rose-pine/neovim'
  -- use 'Mofiqul/dracula.nvim'
  -- use 'catppuccin/nvim'
  -- use 'getomni/neovim'

  -- vim.o.background = 'dark'
  
  -- vim.cmd [[colorscheme tokyonight]]
  -- vim.cmd [[colorscheme omni]]
  -- vim.cmd [[colorscheme onedark]]

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)