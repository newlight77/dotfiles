
" PLUGINS ----------------------------------------------------------------

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
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }

    " marslo ---------------
    " Plug 'kevinw/pyflakes-vim'
    Plug 'pyflakes/pyflakes'
    Plug 'tarmack/vim-python-ftplugin'

    " For Javascript
    Plug 'pangloss/vim-javascript'
    Plug 'jelera/vim-javascript-syntax'

    " For web design
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'

    " Colors and themes and syntax
    Plug 'luochen1990/rainbow'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'Marslo/vim-coloresque'
    Plug 'Marslo/marslo.vim'
    Plug 'Marslo/MarsloVimOthers'

call plug#end()



" COLOR SCHEME ------------------------------------------------------------


set background=dark
"set background=light

"colorscheme dracula

"=====colorscheme tokyonight=======
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:lightline = {'colorscheme' : 'tokyonight'}
let g:airline_theme = 'tokyonight'
colorscheme tokyonight
"=====colorscheme tokyonight=======

"=====colorscheme papercolor======
let g:airline_theme='papercolor'
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:PaperColor_Theme_Options = {'theme': {'default': {'transparent_background': 1}}}
let g:PaperColor_Theme_Options = {'theme': {'default.dark': {'transparent_background': 1}}}
"colorscheme papercolor
"=====colorscheme papercolor=======


" INTERFACE --------------------------------------------------------------
if 'xterm-256color' == $TERM
  set t_Co=256
  colorscheme marslo
  let psc_style='cool'
else
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
  colorscheme marslo16
endif


" GENERAL ----------------------------------------------------------------
set mouse=a

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number

" Highlight cursor line underneath the cursor horizontally.
"set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" STATUS LINE ------------------------------------------------------------

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

"


" MAPPINGS ---------------------------------------------------------------

" Set the backslash as the leader key.
let mapleader = '\'

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']



" Marslo -----------------------------------------------------------------
set nocompatible
syntax enable on
filetype plugin indent on
set history=500
set diffopt=filler,context:3
set wrap                                                            " Wrap lines
set fileformat=unix
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let mapleader=","
let g:mapleader=","

set fileformat=unix
set history=500
set diffopt=filler,context:3
set iskeyword-=.
set autochdir
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030            " Code Format
set termencoding=utf-8
set encoding=utf-8                                                  " Input Chinese (=cp936)
set fileencoding=utf-8
let &termencoding=&encoding
set nobackup noswapfile nowritebackup
set number                                                          " number: line number
set report=0
set autoread                                                        " Set auto read when a file is changed by outside
set showmatch                                                       " Show matching bracets (shortly jump to the other bracets)
set matchtime=1                                                     " The shortly time
set tabstop=2                                                       " Tab width
set softtabstop=2                                                   " Width for backspace
set shiftwidth=2                                                    " the tab width by using >> & <<
set autoindent expandtab
set smartindent
set smarttab						                                            " smarttab: the width of <Tab> in first line would refer to 'Shiftwidth' parameter
set linebreak
set tw=0
set modifiable
set write
set incsearch hlsearch ignorecase smartcase                         " Search
set magic                                                           " Regular Expression
set linespace=0
set wildmenu
set wildmode=longest,list,full                                      " Completion mode that is used for the character
set noerrorbells novisualbell                                       " turn off error beep/flash
set t_vb=
set list listchars=tab:\ \ ,trail:·,extends:»,precedes:«,nbsp:·
set cursorline                                                      " Highlight the current line
set scrolloff=3                                                     " Scroll settings
set sidescroll=1
set sidescrolloff=5
set imcmdline                                                       " Fix context menu messing
set completeopt=longest,menuone                                     " Supper Tab
set foldenable                                                      " Enable Fold
set foldcolumn=1
set foldexpr=1                                                      " Shown line number after fold
set foldlevel=100                                                   " Not fold while VIM set up
set viewoptions=folds
set backspace=indent,eol,start                                      " make backspace h, l, etc wrap to
set whichwrap+=<,>,h,l
set go+=a                                                           " Visual selection automatically copied to the clipboard
set hidden                                                          " Switch between buffers with unsaved change
set equalalways
set formatoptions=tcrqn
set formatoptions+=B                                                " Remove the backspace for combine lines (Only for chinese)
set matchpairs+=<:>
set noendofline
if has('cmdline_info')
  set ruler                                                         " ruler: Show Line and colum number
  set showcmd                                                       " Show (partial) command in status line
endif
if has('statusline')
  set laststatus=2                                                  " Set status bar
  set statusline=%#User2#%m%r%*\ %F\ %y,%{&fileformat}
  set statusline+=%=\ %-{strftime(\"%H:%M\ %d/%m/%Y\")}\ %b[A],0x%B\ %c%V,%l/%L\ %1*--%n%%--%*\ %p%%\ |
endif
" set synmaxcol=128
" set binary
" set cryptmethod=blowfish

if has('persistent_undo')
  set noundofile
endif

noremap <F1> <ESC>
imap <F1> <ESC>a
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap n nzzzv
nnoremap N Nzzzv
map ,bd :bd<CR>
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-a> <ESC>^
imap <C-a> <ESC>I
cnoremap <C-a> <Home>
map <C-e> <ESC>$
imap <C-e> <ESC>A
cnoremap <C-e> <End>
inoremap <A-f> <ESC><Space>Wi
cnoremap <A-f> <S-Right>
inoremap <A-b> <ESC>Bi
cnoremap <A-b> <S-Left>
inoremap <A-d> <ESC>lcW
inoremap <C-d> <Del>
nnoremap Y y$
nnoremap <Del> "_x
xnoremap <Del> "_d
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <space> za
nnoremap & :&&<CR>
xnoremap & :&&<CR>
vmap s <Plug>VSurround
inoremap <leader>tt <C-R>=strftime("%d/%m/%y %H:%M:%S")<cr>
inoremap <leader>fn <C-R>=expand("%:t:r")<CR>
inoremap <leader>fe <C-R>=expand("%:t")<CR>
inoremap <leader>w <C-O>:w<CR>

nnoremap zdb :%s/\s\+$//<CR>
nnoremap zhh :%s/^\s\+//<CR>
nnoremap zmm :g/^/ s//\=line('.').' '/<CR>
nnoremap zws :g/^\s*$/d<CR>
nnoremap zdm :%s/<C-v><CR>//ge<CR>
nnoremap zng :%s///gn<CR>

" Marslo For Function ---------------------------------------------

let g:ctrlp_map = '<c-p>'                                           " CtrlP
let g:ctrlp_working_path_mode = 'ra'                                " Search parents as well (stop searching sartly)
let g:ctrlp_max_height = 8
let g:ctrlp_max_depth = 100
let g:ctrl_root_makers = ['.ctrlp']                                 " Stop search if these files present
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0                                 " Cross session caching
let g:ctrlp_cache_dir = '$HOME/.vim/cache/ctrlp'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|rpm|tar|gz|bz2|zip|ctags|tags)|tags|ctags$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

nmap <leader>tv :ConqueTermSplit bash <CR>

let g:winManagerWidth = 20
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <leader>mm :WMToggle<cr>

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_SingleClick=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_show_Menu=1
let Tlist_sql_settings = 'sql;P:package;t:table'
let Tlist_Process_File_Always=0
nmap <leader>tl :TlistToggle<CR>

map <leader>ta :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_width=20
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_singleclick=1
let g:tagbar_iconchars=['+', '-']
let g:tagbar_autoshowtag=1
let g:tagbar_show_linenumbers=0

let g:EnhCommentifyAlignRight='Yes'
let g:EnhCommentifyRespectIndent='yes'
let g:EnhCommentifyPretty='Yes'
let g:EnhCommentifyMultiPartBlocks='Yes'
let g:EnhCommentifyUseSyntax='Yes'

map <leader>aid :AuthorInfoDetect<CR>
let g:vimrc_author='Marslo'
let g:vimrc_email='marslo.jiao@gmail.com'
au BufWritePre, FileWritePre * :AuthorInfoDetect<CR>

let MRU_Auto_Close = 1                                              " Most Recently Used(MRU)
let MRU_Max_Entries = 10
let MRU_Exclude_Files='^/tmp/.*\|^/temp/.*\|^/media/.*\|^/mnt/.*'
map <leader>re :MRU<CR>

noremap <Leader>u :GundoToggle<CR>

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

let g:rainbow_active = 1
let g:rainbow_operators = 1
let g:rainbow_conf = {
\   'guifgs' : ['#6A5ACD', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],
\   'ctermfgs' : 'xterm-256color' == $TERM ? ['141', '196', '112', '208', '129', '166', '85', '237'] : ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta'],
\   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
\   'separately': {
\     'css': {
\       'parentheses': [['(',')'], ['\[','\]']],
\     },
\     'scss': {
\       'parentheses': [['(',')'], ['\[','\]']],
\     },
\     'html': {
\       'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
\     },
\   }
\}

let g:indentLine_color_gui = "#282828"
let g:indentLine_color_term = 239
let g:indentLine_indentLevel = 20
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_tty = 0
" let g:indentLine_faster = 1
if 'xterm-256color' == $TERM
  let g:indentLine_char = '¦'
elseif has('win32')
  let g:indentLine_color_term = 8
  let g:indentLine_char = '|'
else
  let g:indentLine_color_tty_dark = 0
  let g:indentLine_char = '¦'
endif

let SuperTabDefaultCompletionType = '<c-p>'
let SuperTabMappingForward = '<c-p>'
let SuperTabMappingTabLiteral = '<Tab>'
let SuperTabClosePreviewOnPopupClose = 1

let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsParens = {'(':')', '[':']', '{':'}', '<':'>'}
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/            " For css3

" if isdirectory(bud . '\accelerated-jk')
  " nmap j <Plug>(accelerated_jk_gj)
  " nmap k <Plug>(accelerated_jk_gk)
" endif

autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
autocmd BufRead,BufNewFile *.txt setfiletype txt
autocmd BufRead,BufNewFile *.t set ft=perl
autocmd FileType javascript syntax clear jsFuncBlock

" vim: tabstop=2:softtabstop=2:shiftwidth=2:expandtab
