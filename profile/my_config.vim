call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf'
Plug 'terryma/vim-multiple-cursors'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'

Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'udalov/kotlin-vim'
Plug 'fatih/vim-go'
Plug 'hdima/python-syntax'
Plug 'rust-lang/rust.vim'


Plug 'NLKNguyen/papercolor-theme'
"Plug 'ghifarit53/tokyonight-vim'
"Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()


syntax enable
set background=dark
"set background=light

"=====colorscheme papercolor======
let g:airline_theme='papercolor'
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:PaperColor_Theme_Options = {'theme': {'default': {'transparent_background': 1}}}
let g:PaperColor_Theme_Options = {'theme': {'default.dark': {'transparent_background': 1}}}
colorscheme papercolor
"=====colorscheme papercolor=======

"=====colorscheme tokyonight=======
"set termguicolors
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"let g:lightline = {'colorscheme' : 'tokyonight'}
"let g:airline_theme = 'tokyonight'
"colorscheme tokyonight
"=====colorscheme tokyonight=======


"colorscheme dracula

"#nmap <silent> t<C-n> :TestNearest<CR>
"#nmap <silent> t<C-f> :TestFile<CR>
"#nmap <silent> t<C-s> :TestSuite<CR>
"#nmap <silent> t<C-l> :TestLast<CR>
"#nmap <silent> t<C-g> :TestVisit<CR>

