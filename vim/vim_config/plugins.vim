"----------------------------------------------------------------
" Install Plugins (vim-plug)
"----------------------------------------------------------------
" List of plugins installed
call plug#begin('~/.vim/plugged')

  Plug 'janko-m/vim-test'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-dispatch'

  " Statusbar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Git tools
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-rhubarb'

  " Sessions
  Plug 'xolox/vim-session'
  Plug 'xolox/vim-misc'

  " Tools
  Plug 'preservim/nerdtree'
  Plug 'valloric/listtoggle'
  Plug 'majutsushi/tagbar'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-scripts/mru.vim'
  Plug 'nvim-telescope/telescope.nvim'

  " Search
  Plug 'mileszs/ack.vim'

  " Commenting
  Plug 'preservim/nerdcommenter', { 'commit': 'a5d1663' }
  Plug 'tpope/vim-commentary'
  Plug 'suy/vim-context-commentstring'

  " Autocomplete
  Plug 'valloric/youcompleteme'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  Plug 'deoplete-plugins/deoplete-zsh', { 'commit': '12141ad' }
  Plug 'Shougo/neosnippet.vim', { 'commit': '037b7a7' }
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/context_filetype.vim'
  Plug 'ervandew/supertab'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'honza/vim-snippets'
  
  " lsp
  if has("nvim")
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'tami5/lspsaga.nvim'
    Plug 'folke/lsp-colors.nvim'
    Plug 'onsails/lspkind-nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'hoob3rt/lualine.nvim'

    "  Plug 'prabirshrestha/vim-lsp'
    "  Plug 'Shougo/deoplete.nvim'
    "  Plug 'lighttiger2505/deoplete-vim-lsp'  
  endif

  " C/C++ support
  Plug 'deoplete-plugins/deoplete-clang', { 'commit': '30f17cb' }

  " Go support
  Plug 'fatih/vim-go', { 'tag': 'v1.19' }
  Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
  Plug 'deoplete-plugins/deoplete-go', { 'commit': 'fa73f06'}

  " Kotlin languages
  Plug 'udalov/kotlin-vim'

  " Perl support
  Plug 'c9s/perlomni.vim'

  " Python support
  Plug 'deoplete-plugins/deoplete-jedi', { 'commit': '46121d9' }
  Plug 'hdima/python-syntax'
  Plug 'pyflakes/pyflakes'
  Plug 'tarmack/vim-python-ftplugin'
  Plug 'kevinw/pyflakes-vim'

  " Ruby support
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-liquid'

  " PHP support
  Plug 'shawncplus/phpcomplete.vim'

  " Haskell support
  Plug 'eagletmt/neco-ghc'

  " Rust support
  Plug 'racer-rust/vim-racer'

  " JavaScript support
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'othree/jspc.vim'
  Plug 'maksimr/vim-jsbeautify'

  " VimL support
  Plug 'Shougo/neco-vim', { 'commit' : '4c0203b' }

  " For web design
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'elzr/vim-json'
  Plug 'othree/html5.vim'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'mxw/vim-jsx'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'mattn/emmet-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'kchmck/vim-coffee-script'
  Plug 'groenewege/vim-less'
  Plug 'kyazdani42/nvim-web-devicons'

  " Additional syntax files
  Plug 'w0rp/ale'
  Plug 'vim-syntastic/syntastic'
  Plug 'vim-language-dept/css-syntax.vim'
  Plug 'Shougo/neco-syntax', { 'commit': '98cba4a' }
  Plug 'mboughaba/i3config.vim'
  Plug 'aklt/plantuml-syntax'
  Plug 'gerardbm/asy.vim'
  Plug 'gerardbm/eukleides.vim'
  Plug 'zaid/vim-rec'
  Plug 'sirtaj/vim-openscad'
  Plug 'nvim-treesitter/nvim-treesitter'

  " Edition
  Plug 'junegunn/vim-easy-align'
  Plug 'godlygeek/tabular'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-capslock'
  Plug 'wellle/targets.vim'
  Plug 'christoomey/vim-sort-motion'
  Plug 'terryma/vim-expand-region'
  Plug 'Valloric/MatchTagAlways'
  Plug 'FooSoft/vim-argwrap'
  Plug 'gerardbm/vim-md-headings'
  Plug 'matze/vim-move'
  Plug 'Yggdroot/indentLine'
  Plug 'editorconfig/editorconfig-vim'

  " Misc
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-characterize'
  Plug 'tyru/open-browser.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'mattn/webapi-vim'
  Plug 'vimwiki/vimwiki', { 'branch': 'master' }
  Plug 'chr4/nginx.vim'

  " Color schemes
  Plug 'maximbaz/lightline-ale'
  Plug 'itchyny/lightline.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'flazz/vim-colorschemes'
  Plug 'gerardbm/vim-atomic'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'luochen1990/rainbow'

call plug#end()
