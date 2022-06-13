"----------------------------------------------------------------
"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"
"----------------------------------------------------------------
"  Version : 2.6.1
"  License : MIT
"  Author  : Gerard Bajona
"  URL     : https://github.com/gerardbm/vimrc
"----------------------------------------------------------------
"  Index:
"   1. General settings
"   2. Plugins (Plug)
"   3. Plugins settings
"   4. User interface
"   5. Scheme and colors
"   6. Files and backup
"   7. Buffers management
"   8. Tabs management
"   9. Multiple windows
"  10. Indentation tabs
"  11. Moving around lines
"  12. Paste mode
"  13. Search, vimgrep and grep
"  14. Text edition
"  15. Make settings
"  16. Filetype settings
"  17. Helper functions
"  18. External tools integration
"----------------------------------------------------------------

"----------------------------------------------------------------
" 1. General settings
"----------------------------------------------------------------
" Disable vi compatibility
if !has("nvim")
  set nocompatible
endif

" Reload .vimrc
nnoremap <F12> :so $MYVIMRC<CR>

" Lines of memory to remember
set history=10000

" Leader key to add extra key combinations
let mapleader = ','
let g:mapleader = ','

" Time delay on <Leader> key
set timeoutlen=3000 ttimeoutlen=100

" Update time
set updatetime=250

" Trigger InsertLeave autocmd
inoremap <C-c> <Esc>

" No need for Ex mode
nnoremap Q <NOP>

" Open help in a vertical window
cnoreabbrev help vert help

" Terminal (nvim)
if has("terminal") && has("nvim")
  nnoremap <silent> <F7> :call <SID>ToggleTerminal()<CR>
  tnoremap <silent> <F7> <C-\><C-n><Bar>:wincmd p<CR>
  tnoremap <Esc> <C-\><C-n>
endif

" Set inc/dec
set nrformats-=octal

" Do not save backup files.
set nobackup
set noswapfile
set nowritebackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
set sidescroll=1
set sidescrolloff=5

" Highlight cursor line underneath the cursor horizontally.
"set cursorline 

" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" Completion mode that is used for the character
set wildmode=longest,list,full

" Wrap lines
set wrap                         

set fileformat=unix
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030            " Code Format
set termencoding=utf-8
set encoding=utf-8                                                  " Input Chinese (=cp936)
set fileencoding=utf-8
let &termencoding=&encoding

" Set auto read when a file is changed by outside
set autoread

set foldenable                                                      " Enable Fold
set foldcolumn=1
set foldexpr=1                                                      " Shown line number after fold
set foldlevel=100                                                   " Not fold while VIM set up

if has('cmdline_info')
  set ruler                                                         " ruler: Show Line and colum number
  set showcmd                                                       " Show (partial) command in status line
endif

"----------------------------------------------------------------
" 2. Plugins (Plug)
"----------------------------------------------------------------
" List of plugins installed
call plug#begin('~/.vim/plugged')

  Plug 'honza/vim-snippets'
  Plug 'janko-m/vim-test'
  "lug 'terryma/vim-multiple-cursors'
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

  " Sessions
  Plug 'xolox/vim-session'
  Plug 'xolox/vim-misc'

  " Tools
  "Plug 'tpope/vim-commentary'
  "Plug 'suy/vim-context-commentstring'
  Plug 'preservim/nerdcommenter', { 'commit': 'a5d1663' }
  Plug 'preservim/nerdtree'
  "Plug 'valloric/listtoggle'
  Plug 'majutsushi/tagbar'
  Plug 'kien/ctrlp.vim'
  Plug 'mbbill/undotree'
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  " Deoplete, specific for Vim8
  if !has("nvim")
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " Autocomplete
  Plug 'valloric/youcompleteme'
  Plug 'Shougo/deoplete.nvim', { 'commit': '17ffeb9' }
  Plug 'Shougo/neosnippet.vim', { 'commit': '037b7a7' }
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/context_filetype.vim'
  Plug 'ervandew/supertab'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " C/C++ support
  "Plug 'deoplete-plugins/deoplete-clang', { 'commit': '30f17cb' }

  " Go support
  Plug 'fatih/vim-go', { 'tag': 'v1.19' }
  Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
  Plug 'deoplete-plugins/deoplete-go', { 'commit': 'fa73f06'}

  " Kotlin languages
  "Plug 'udalov/kotlin-vim'

  " Perl support
  "Plug 'c9s/perlomni.vim'

  " Python support
  Plug 'deoplete-plugins/deoplete-jedi', { 'commit': '46121d9' }
  Plug 'hdima/python-syntax'
  Plug 'pyflakes/pyflakes'
  Plug 'tarmack/vim-python-ftplugin'
  " Plug 'kevinw/pyflakes-vim'

  " Ruby support
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-liquid'

  " PHP support
  "Plug 'shawncplus/phpcomplete.vim'

  " Haskell support
  "Plug 'eagletmt/neco-ghc'

  " Rust support
  Plug 'racer-rust/vim-racer'

  " Zsh support
  Plug 'deoplete-plugins/deoplete-zsh', { 'commit': '12141ad' }

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

  " Additional syntax files
  Plug 'w0rp/ale'
  Plug 'vim-syntastic/syntastic'
  Plug 'vim-language-dept/css-syntax.vim'
  Plug 'Shougo/neco-syntax', { 'commit': '98cba4a' }
  Plug 'aklt/plantuml-syntax'

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

  " Misc
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-characterize'
  Plug 'tyru/open-browser.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'mattn/webapi-vim'
  Plug 'vimwiki/vimwiki', { 'branch': 'master' }

  " Color schemes
  Plug 'altercation/vim-colors-solarized'
  Plug 'flazz/vim-colorschemes'
  Plug 'gerardbm/vim-atomic'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'luochen1990/rainbow'

call plug#end()

"----------------------------------------------------------------
" 3. Plugins settings
"----------------------------------------------------------------
" --- Statusbar ---
" Airline settings
let g:airline_theme                       = 'atomic'
let g:airline_powerline_fonts             = 1
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z                   = airline#section#create([
      \ '%1p%% ',
      \ 'Ξ%l%',
      \ '\⍿%c'])
call airline#parts#define_accent('mode', 'black')

" --- Git tools ---
" Gitgutter settings
let g:gitgutter_max_signs             = 5000
let g:gitgutter_sign_added            = '+'
let g:gitgutter_sign_modified         = '»'
let g:gitgutter_sign_removed          = '_'
let g:gitgutter_sign_modified_removed = '»╌'
let g:gitgutter_map_keys              = 0
let g:gitgutter_diff_args             = '--ignore-space-at-eol'

nmap <Leader>j <Plug>(GitGutterNextHunk)zz
nmap <Leader>k <Plug>(GitGutterPrevHunk)zz
nnoremap <silent> <C-g> :call <SID>ToggleGGPrev()<CR>zz
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>

" Fugitive settings
nnoremap <C-s> :call <SID>ToggleGstatus()<CR>
nnoremap <Leader>gv :Gvdiffsplit<CR>:windo set wrap<CR>
nnoremap <Leader>gh :Gvdiffsplit HEAD<CR>:windo set wrap<CR>
nnoremap <Leader>gb :Gblame<CR>

" Searching for text added or removed by a commit
nnoremap <Leader>gg :call <SID>GrepWrapper('Gclog', '-i -G', '--')<CR>

" GV settings
nnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>
vnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>

" --- Sessions ---
" Vim-session settings
let g:session_autosave  = 'no'
let g:session_autoload  = 'no'
let g:session_directory = '~/.vim/sessions/'

nnoremap <C-b> :OpenSession<CR>

" --- Tools ---
" NERDCommenter settings
let g:NERDDefaultAlign          = 'left'
let g:NERDSpaceDelims           = 1
let g:NERDCompactSexyComs       = 1
let g:NERDCommentEmptyLines     = 0
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters      = {
  \ 'python': {'left': '#'},
  \ }

nnoremap cc :call NERDComment(0,'toggle')<CR>
vnoremap cc :call NERDComment(0,'toggle')<CR>

" NERDTree settings
let g:NERDTreeShowHidden        = 1

" NERDTree-git-plugin settings
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" NERDTree ---------------------------------------------
let g:nerdtreemsg = 'Toggle NERDTree.'
nnoremap <silent> <leader><F3> :call <SID>ToggleNERDTree()<CR>:echo g:nerdtreemsg<CR>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" NERDTree ---------------------------------------------

" ALE settings
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_linters = {
  \ 'c'          : ['clang'],
  \ 'vim'        : ['vint'],
  \ 'python'     : ['pylint'],
  \ 'javascript' : ['eslint'],
  \ 'typescript' : ['eslint'],
  \ 'css'        : ['csslint'],
  \ 'tex'        : ['chktex'],
  \ }
"let g:ale_javascript_eslint_executable='npx eslint'


" FZF settings
let $FZF_PREVIEW_COMMAND = 'cat {}'
nnoremap <C-f><C-f> :Files<CR>
nnoremap <C-f><C-g> :Commits<CR>
nnoremap <C-f><Space> :BLines<CR>

" Navigate between errors
nnoremap <Leader>h :lprevious<CR>zz
nnoremap <Leader>l :lnext<CR>zz

" Listtoggle settings
let g:lt_location_list_toggle_map = '<leader>e'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Tagbar toggle (custom function)
let g:ctmsg = 'Toggle Tagbar.'
nnoremap <silent> <C-t> :call <SID>ToggleTagbar()<CR>:echo g:ctmsg<CR>
let g:tagbar_autofocus        = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_sort             = 0

" CtrlP settings
let g:ctrlp_map                 = '<C-p>'
let g:ctrlp_cmd                 = 'CtrlPBuffer'
let g:ctrlp_working_path_mode   = 'rc'
let g:ctrlp_custom_ignore       = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:10,results:85'
let g:ctrlp_show_hidden         = 1
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_open_multiple_files = '0i'
let g:ctrlp_prompt_mappings     = {
  \ 'PrtHistory(1)'        : [''],
  \ 'PrtHistory(-1)'       : [''],
  \ 'ToggleType(1)'        : ['<C-l>', '<C-up>'],
  \ 'ToggleType(-1)'       : ['<C-h>', '<C-down>'],
  \ 'PrtCurLeft()'         : ['<C-b>', '<Left>'],
  \ 'PrtCurRight()'        : ['<C-f>', '<Right>'],
  \ 'PrtBS()'              : ['<C-s>', '<BS>'],
  \ 'PrtDelete()'          : ['<C-d>', '<DEL>'],
  \ 'PrtDeleteWord()'      : ['<C-w>'],
  \ 'PrtClear()'           : ['<C-u>'],
  \ 'PrtClearCache()'      : ['<C-r>'],
  \ 'ToggleByFname()'      : ['<C-g>'],
  \ 'ToggleFocus()'        : ['<tab>'],
  \ 'AcceptSelection("e")' : ['<C-m>', '<CR>'],
  \ 'AcceptSelection("h")' : ['<C-x>'],
  \ 'AcceptSelection("t")' : ['<C-t>'],
  \ 'AcceptSelection("v")' : ['<C-v>'],
  \ 'OpenMulti()'          : ['<C-o>'],
  \ 'MarkToOpen()'         : ['<c-z>'],
  \ 'PrtExit()'            : ['<esc>', '<c-c>', '<c-p>'],
  \ }

" Undotree toggle
nnoremap <Leader>u :UndotreeToggle<CR>

" --- Languages ---
" Go settings
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path                    = expand('~/.gotools')
let g:go_list_type                   = 'quickfix'
let g:go_version_warning             = 0 " Keep until vim v8.0.1453, nvim v3.2

" CSS3 settings
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" Javascript settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

" Tern_for_vim settings
let g:tern#command   = ['tern']
let g:tern#arguments = ['--persistent']

" JS-Beautify
let g:config_Beautifier = {}
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].indent_style = 'tab'
let g:config_Beautifier['jsx'] = {}
let g:config_Beautifier['jsx'].indent_style = 'tab'
let g:config_Beautifier['json'] = {}
let g:config_Beautifier['json'].indent_style = 'tab'
let g:config_Beautifier['css'] = {}
let g:config_Beautifier['css'].indent_style = 'tab'
let g:config_Beautifier['html'] = {}
let g:config_Beautifier['html'].indent_style = 'tab'

augroup beautify
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <Leader>bf :call JsBeautify()<cr>
  autocmd FileType javascript vnoremap <buffer> <Leader>bf :call RangeJsBeautify()<cr>
  autocmd FileType json nnoremap <buffer> <Leader>bf :call JsonBeautify()<cr>
  autocmd FileType json vnoremap <buffer> <Leader>bf :call RangeJsonBeautify()<cr>
  autocmd FileType jsx nnoremap <buffer> <Leader>bf :call JsxBeautify()<cr>
  autocmd FileType jsx vnoremap <buffer> <Leader>bf :call RangeJsxBeautify()<cr>
  autocmd FileType html nnoremap <buffer> <Leader>bf :call HtmlBeautify()<cr>
  autocmd FileType html vnoremap <buffer> <Leader>bf :call RangeHtmlBeautify()<cr>
  autocmd FileType css nnoremap <buffer> <Leader>bf :call CSSBeautify()<cr>
  autocmd FileType css vnoremap <buffer> <Leader>bf :call RangeCSSBeautify()<cr>
augroup end

" --- Autocomplete ---

" Conquer of completion ---------------------------------------------

nnoremap <silent> K :call CocAction('doHover')<CR>


let g:coc_global_extensions = [
\ 'coc-tsserver'
\ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
let g:coc_global_extensions += ['coc-eslint']
endif


function! ShowDocIfNoDiagnostic(timer_id)
if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
endif
endfunction

function! s:show_hover_doc()
call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

augroup vimrc
au BufReadPre * setlocal foldmethod=indent
au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END


" Conquer of completion ---------------------------------------------

" emmet-vim ---------------------------------------------

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" emmet-vim ---------------------------------------------

" Deoplete settings
" - «Deoplete requires Neovim with Python3 enabled»
let g:python3_host_prog       = '/usr/bin/python3'
let g:python3_host_skip_check = 1

autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#functions    = {}
call deoplete#custom#option('auto_complete_delay', 250)

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Python autocompletion
let g:deoplete#sources#jedi#show_docstring = 1

" Go autocompletion
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache     = 1

" Javascript autocompletion
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni',
  \ ]

" Clang autocompletion
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" --- Snippets ---
" Neosnippet settings
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)

" Behaviour like SuperTab
smap <expr><TAB>
  \ neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers
if has('conceal')
  set conceallevel=0 concealcursor=niv
  nnoremap <silent> coi :set conceallevel=0<CR>:set concealcursor=niv<CR>
  nnoremap <silent> coo :set conceallevel=2<CR>:set concealcursor=vc<CR>
  nnoremap <silent> cop :set conceallevel=2<CR>:set concealcursor=niv<CR>
  nnoremap <silent> com :set conceallevel=3<CR>:set concealcursor=niv<CR>
endif

augroup all
  autocmd InsertLeave * NeoSnippetClearMarkers
augroup end

" --- Edition ---
" Easy align settings
xmap gi <Plug>(EasyAlign)
nmap gi <Plug>(EasyAlign)

" Tabularize (e.g. /= or /:)
vnoremap <Leader>x :Tabularize /

" Tabularize only the first match on the line (e.g. /=.*/)
vnoremap <Leader>X :Tabularize /.*/<Left><Left><Left>

" Auto-pairs settings
" Maps for normal and insert modes
let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsParens = {'(':')', '[':']', '{':'}', '<':'>'}
let g:AutoPairsFlyMode        = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump   = '<C-z>'
let g:AutoPairsShortcutToggle = '<C-q>'

" Workaround to fix an Auto-pairs bug until it gets fixed
if has("nvim")
  autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
endif

" Closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.html.erb,*.md'

" Surround settings
" Use 'yss?', 'yss%' or 'yss=' to surround a line
autocmd FileType php let b:surround_{char2nr('p')} = "<?php \r ?>"
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('p')} = "{% \r %}"
autocmd FileType markdown,liquid let b:surround_{char2nr('i')} = "_\r_"
autocmd FileType markdown,liquid let b:surround_{char2nr('o')} = "**\r**"
autocmd FileType markdown,liquid let b:surround_{char2nr('x')} = "«\r»"
autocmd FileType markdown,liquid let b:surround_{char2nr('h')} = "\[\r\]\(//\)"
autocmd FileType markdown,liquid let b:surround_{char2nr('j')} = "!\[\r\]
      \\(/images/\){: .align-}"
autocmd FileType markdown,liquid let b:surround_{char2nr('e')} = "\[\r\]
      \\(\){:rel=\"noopener noreferrer\" target=\"_blank\"}"
autocmd FileType markdown,liquid let b:surround_{char2nr('y')} = "<a href=\"\"
      \ rel=\"noopener noreferrer\" target=\"_blank\">\r<\/a>"

" Caps Lock settings
imap <expr><C-l> deoplete#smart_close_popup()."\<Plug>CapsLockToggle"
cmap <silent> <C-l> <Plug>CapsLockToggle

" Expand region settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" MatchTagAlways settings
let g:mta_filetypes = {
  \ 'html'  : 1,
  \ 'xhtml' : 1,
  \ 'xml'   : 1,
  \ 'jinja' : 1,
  \ 'php'   : 1,
  \ }

" ArgWrap settings
let g:argwrap_tail_comma    = 1
let g:argwrap_padded_braces = '[{'

nnoremap <Leader>W :ArgWrap<CR>

" Vim-move settings. Use Shift
let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'

" --- Misc ---
" Vim-tmux navigator settings
let g:tmux_navigator_no_mappings = 1

" Open-browser settings
let g:openbrowser_browser_commands = [{
  \ 'name': 'w3m',
  \ 'args': 'tmux new-window w3m {uri}',
  \ }]

nmap <Leader>gl <Plug>(openbrowser-open)

" Goyo settings
let g:goyo_width  = "80"
let g:goyo_height = "100%"
let g:goyo_linenr = 0

nnoremap <F11> :Goyo<CR>

" Vimwiki settings
let g:vimwiki_url_maxsave   = 0
let g:vimwiki_global_ext    = 0
let g:vimwiki_syntax        = 'markdown'
let g:vimwiki_list          = [
  \ {'path': '~/Workspace/vimwiki'},
  \ {'path': '~/Workspace/vimwiki/Articles'},
  \ {'path': '~/Workspace/vimwiki/Codes'},
  \ {'path': '~/Workspace/vimwiki/Notes'},
  \ {'path': '~/Workspace/vimwiki/Projects'},
  \ {'path': '~/Workspace/vimwiki/Studies'},
  \ {'path': '~/Workspace/vimwiki/ToDos'},
  \ {'path': '~/Workspace/vimwiki/Unix'}
  \ ]

nnoremap <Leader>we :VimwikiToggleListItem<CR>
vnoremap <Leader>we :VimwikiToggleListItem<CR>

"----------------------------------------------------------------
" 4. User interface
"----------------------------------------------------------------
" Set X lines to the cursor when moving vertically
set scrolloff=0

" Always show mode
set showmode

" Show command keys pressed
set showcmd

" Enable the WiLd menu
set wildmenu

" Show the current position
set ruler

" Command bar height
set cmdheight=2

" Backspace works on Insert mode
set backspace=eol,start,indent

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell

if !has("nvim")
  set t_vb=

  " Terminal keycodes
  if &term =~ 'screen'
    set <F1>=[11~
    set <F2>=[12~
    set <F3>=[13~
    set <F4>=[14~
    set <F5>=[15~
    set <F6>=[17~
    set <F7>=[18~
    set <F8>=[19~
    set <F9>=[20~
    set <F10>=[21~
    set <F11>=[23~
    set <F12>=[24~
    set <S-F1>=[11;2~
    set <S-F2>=[12;2~
    set <S-F3>=[13;2~
    set <S-F4>=[14;2~
    set <S-F5>=[15;2~
    set <S-F6>=[17;2~
    set <S-F7>=[18;2~
    set <S-F8>=[19;2~
    set <S-F9>=[20;2~
    set <S-F10>=[21;2~
    set <S-F11>=[23;2~
    set <S-F12>=[24;2~
  endif
endif

" Mouse
set mouse=a

" Highlight cursor line and cursor column
set cursorline
set nocursorcolumn

" Always show the status line
set laststatus=2

" Change the cursor shape
if !has("nvim")
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
else
  set guicursor=n-v:block-Cursor/lCursor-blinkon0
  set guicursor+=i-ci-c:ver100-Cursor/lCursor-blinkon0
  set guicursor+=r-cr:hor100-Cursor/lCursor-blinkon0
endif

" Omni completion
if has('autocmd') && exists('+omnifunc')
autocmd Filetype *
  \ if &omnifunc == "" |
  \     setlocal omnifunc=syntaxcomplete#Complete |
  \ endif
endif

" Fix italics issue
if !has("nvim")
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

"----------------------------------------------------------------
" 5. Scheme and colors
"----------------------------------------------------------------
" True color
" if !has("nvim")
"   if has("termguicolors")
"       let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"       let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"       set termguicolors
"   endif
" else
"   set termguicolors
" endif

" Syntax highlighting
syntax enable

" Color scheme
" colorscheme atomic

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
"let g:airline_theme='papercolor'
"let g:lightline = { 'colorscheme': 'PaperColor' }
"let g:PaperColor_Theme_Options = {'theme': {'default': {'transparent_background': 1}}}
"let g:PaperColor_Theme_Options = {'theme': {'default.dark': {'transparent_background': 1}}}
"colorscheme papercolor
"=====colorscheme papercolor=======

" ======rainbow===================
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
" ======rainbow===================


" Show syntax highlighting groups
nnoremap <Leader>B :call <SID>SynStack()<CR>

"----------------------------------------------------------------
" 6. Files and backup
"----------------------------------------------------------------
" Disable swap files
set noswapfile

" No backup (use Git instead)
set nobackup

" Prevents automatic write backup
set nowritebackup

" Use UTF-8 as default encoding
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Autoread a file when it is changed from the outside
set autoread

" Reload a file when it is changed from the outside
let g:f5msg = 'Buffer reloaded.'
nnoremap <F5> :e<CR>:echo g:f5msg<CR>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Allow us to use Ctrl-s and Ctrl-q as keybinds
" Restore default behaviour when leaving Vim.
if !has("nvim")
  silent !stty -ixon
  autocmd VimLeave * silent !stty ixon
endif

" Save the current buffer
nnoremap <Leader>s :update<CR>

" Save all buffers
nnoremap <Leader>S :bufdo update<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
cnoremap WW w !sudo tee > /dev/null %

" Rename file
nnoremap <F2> :call <SID>RenameFile()<CR>

" Work on buffer
nnoremap yab :%y<CR>
nnoremap dab :%d<CR>
nnoremap vab ggVG

"----------------------------------------------------------------
" 7. Buffers management
"----------------------------------------------------------------
" Buffer hidden when it is abandoned
set hidden

" Close the current buffer
nnoremap <Leader>bd :call <SID>CustomCloseBuffer()<CR>

" Move between buffers
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

" Edit and explore buffers
nnoremap <Leader>bb :edit <C-R>=expand("%:p:h")<CR>/
nnoremap <Leader>bg :buffers<CR>:buffer<Space>

" Switch CWD to the directory of the current buffer
nnoremap <Leader>bw :lcd %:p:h<CR>:pwd<CR>

" Copy the filepath to clipboard
nnoremap <Leader>by :let @+=expand("%:p")<CR>

" Ignore case when autocompletes when browsing files
set fileignorecase

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Remember info about open buffers on close
" set viminfo^=%

"----------------------------------------------------------------
" 8. Tabs management
"----------------------------------------------------------------
" Open a new tab with the current buffer's path
" Useful when editing files in the same directory
nnoremap <Leader>tt :tabedit <C-R>=expand("%:p:h")<CR>/

" Create and close tabs
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>


" Move tabs position
nnoremap <Leader>tr :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Leader>ty :execute 'silent! tabmove ' . tabpagenr()<CR>

"----------------------------------------------------------------
" 9. Multiple windows
"----------------------------------------------------------------
" Remap wincmd
map <Leader>, <C-w>

set winminheight=0
set winminwidth=0
set splitbelow
set splitright
set fillchars+=stlnc:\/,vert:│,fold:―,diff:―

" Split windows
map <C-w>- :split<CR>
map <C-w>. :vsplit<CR>
"  map <C-w>j :close<CR>
"  map <C-w>x :q!<CR>
"  map <C-w>, <C-w>=

" Resize windows
if bufwinnr(1)
  map + :resize +1<CR>
  map - :resize -1<CR>
  map < :vertical resize +1<CR>
  map > :vertical resize -1<CR>
endif

" Toggle resize window
nnoremap <silent> <C-w>f :call <SID>ToggleResize()<CR>

" Last, previous and next window; and only one window
nnoremap <silent> <C-w>l :wincmd p<CR>:echo "Last window."<CR>
nnoremap <silent> <C-w>p :wincmd w<CR>:echo "Previous window."<CR>
nnoremap <silent> <C-w>n :wincmd W<CR>:echo "Next window."<CR>
nnoremap <silent> <C-w>o :wincmd o<CR>:echo "Only one window."<CR>

" Move between Vim windows and Tmux panes
" - It requires the corresponding configuration into Tmux.
" - Check it at my .tmux.conf from my dotfiles repository.
" - URL: https://github.com/gerardbm/dotfiles/blob/master/tmux/.tmux.conf
" - Plugin required: https://github.com/christoomey/vim-tmux-navigator
if !has("nvim")
  set <M-h>=h
  set <M-j>=j
  set <M-k>=k
  set <M-l>=l
endif

nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader><BS> mmHmt:%s/<C-v><CR>//ge<CR>'tzt`m

" Close the preview window
nnoremap <silent> <Leader>. :pclose<CR>

" Scroll the preview window
if !has("nvim")
  set <M-d>=d
  set <M-u>=u
endif

nnoremap <silent> <M-d> :wincmd P<CR>5<C-e>:wincmd p<CR>
nnoremap <silent> <M-u> :wincmd P<CR>5<C-y>:wincmd p<CR>

"----------------------------------------------------------------
" 10. Indentation tabs
"----------------------------------------------------------------

" IndentLine ---------------------------------------------

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

" IndentLine ---------------------------------------------

" Enable autoindent & smartindent
set autoindent
set smartindent

" Use tabs, no spaces
set noexpandtab

" Be smart when using tabs
set smarttab

" Tab size (in spaces)
set shiftwidth=2
set tabstop=2

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Remap indentation
nnoremap <TAB> >>
nnoremap <S-TAB> <<

vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

inoremap <TAB> <C-i>
inoremap <S-TAB> <C-d>

" Don't show tabs
set list

let g:f6msg = 'Toggle list.'
nnoremap <F6> :set list!<CR>:echo g:f6msg<CR>

" Show tabs and end-of-lines
set listchars=tab:│\ ,trail:¬

"----------------------------------------------------------------
" 11. Moving around lines
"----------------------------------------------------------------
" Specify which commands wrap to another line
set whichwrap+=<,>,h,l

" Many jump commands move the cursor to the start of line
set nostartofline

" Wrap lines into the window
set wrap

" Don't break the words
" Only works if I set nolist (F6)
set linebreak
set showbreak=├——»

" Stop automatic wrapping
set textwidth=0

" Column at 80 width
set colorcolumn=80

" Listings don't pause
set nomore

" Color column
let g:f10msg = 'Toggle colorcolumn.'
nnoremap <silent> <F10> :call <SID>ToggleColorColumn()<CR>:echo g:f10msg<CR>

" Show line numbers
set number
set numberwidth=2

let g:f4msg = 'Toggle line numbers.'
nnoremap <silent> <F4> :set number!<CR>:echo g:f4msg<CR>

" Set relative line numbers
set relativenumber

let g:f4msg = 'Toggle relative line numbers.'
nnoremap <silent> <F4>r :set norelativenumber!<CR>:echo g:f4msg<CR>

" Treat long lines as break lines (useful when moving around in them)
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

vnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

"  nnoremap <Home> g^
"  nnoremap <End> g$

"  vnoremap <Home> g^
"  vnoremap <End> g$

"  " Toggle the cursor position start/end of the line
"  nnoremap <silent> ñ :call <SID>ToggleCPosition('')<CR>
"  vnoremap <silent> ñ <Esc>:call <SID>ToggleCPosition('normal! gv')<CR>

" Join / split lines
nnoremap <C-j> J
nnoremap <C-k> i<CR><Esc>

" Duplicate a line
nnoremap cx yyP
nnoremap cv yyp

" Folding
set foldmethod=marker

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" --- Readline commands ---
"----------------------------------------------------------------
" Move the cursor to the line start
"  inoremap <C-a> <C-O>0

" Move the cursor to the line end
"  inoremap <C-e> <C-O>$

" Moves the cursor back one character
"  inoremap <expr><C-b> deoplete#smart_close_popup()."\<Left>"

" Moves the cursor forward one character
"  inoremap <expr><C-f> deoplete#smart_close_popup()."\<Right>"

" Remove one character
"  inoremap <C-d> <DEL>

" Command Mode
"  cnoremap <C-b> <Left>
"  cnoremap <C-f> <Right>
"  cnoremap <C-a> <Home>
"  cnoremap <C-e> <End>
"  cnoremap <C-d> <DEL>
"  cnoremap <C-p> <Up>
"  cnoremap <C-n> <Down>
"  cnoremap <C-v> <C-r>"
"  cnoremap <C-q> <S-Right><C-w>


" Allow moving one or multiple lines ===============

function! MoveLines(offset) range
    let l:col = virtcol('.')
    let l:offset = str2nr(a:offset)
    exe 'silent! :' . a:firstline . ',' . a:lastline . 'm'
        \ . (l:offset > 0 ? a:lastline + l:offset : a:firstline + l:offset)
    exe 'normal ' . l:col . '|'
endf
nmap <silent> <S-up> :call MoveLines('-2')<CR>
nmap <silent> <S-down> :call MoveLines('+1')<CR>
vmap <silent> <S-up> :call MoveLines('-2')<CR>gv
vmap <silent> <S-down> :call MoveLines('+1')<CR>gv


"----------------------------------------------------------------
" 12. Paste mode
"----------------------------------------------------------------
" Bracketed paste mode
" - Source: https://ttssh2.osdn.jp/manual/en/usage/tips/vim.html
if !has("nvim")
  if has("patch-8.0.0238")
    if &term =~ "screen"
      let &t_BE = "\e[?2004h"
      let &t_BD = "\e[?2004l"
      exec "set t_PS=\e[200~"
      exec "set t_PE=\e[201~"
    endif
  endif
endif

"----------------------------------------------------------------
" 13. Search, vimgrep and grep
"----------------------------------------------------------------
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Search, wrap around the end of the buffer
set wrapscan

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" For regular expressions turn magic on
set magic

" Maximum amount of memory in Kbyte used for pattern matching
set maxmempattern=1000

" --- Highlight ---
"----------------------------------------------------------------
" Map <Space> to / (search)
nnoremap <Space> /
nnoremap <Leader><Space> ?

" Highlight the word under the cursor and don't jump to next
nnoremap <silent> <Leader><CR> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hlsearch<CR>

" Highlight the selected text and don't jump to next
vnoremap <silent> <Leader><CR> :<C-U>call <SID>VSetSearch()<CR>:set hlsearch<CR>

" Disable highlight
nnoremap <Leader>m :noh<CR>

" Search into a Visual selection
vnoremap <silent> <Space> :<C-U>call <SID>RangeSearch('/')<CR>
  \ :if strlen(g:srchstr) > 0
  \ \|exec '/'.g:srchstr\|endif<CR>n
vnoremap <silent> ? :<C-U>call <SID>RangeSearch('?')<CR>
  \ :if strlen(g:srchstr) > 0
  \ \|exec '?'.g:srchstr\|endif<CR>N

" --- Vimgrep and grep ---
"----------------------------------------------------------------
" Vimgrep the highlight in the current file
nnoremap <Leader>vg :vimgrep /<C-R>//j %<CR>

" Vimgrep the highlight in the current directory and subdirectories
nnoremap <Leader>vf :vimgrep /<C-R>//j **/*.

autocmd QuickfixCmdPre grep,grepadd,vimgrep,vimgrepadd,helpgrep copen

" Grep settings
set grepprg=grep\ -nHi

" Current buffer
nnoremap <Leader>vv :call <SID>GrepWrapper('grep!', '', '%')<CR>

" Current working directory
nnoremap <Leader>vn :call <SID>GrepWrapper('grep!', '-R
      \ --exclude-dir={.git,.svn,.jekyll-cache,_site}
      \ --exclude=LICENSE', '')<CR>

" Current buffer (grepadd)
nnoremap <Leader>vm :call <SID>GrepWrapper('grepadd!', '', '%')<CR>

" Current arglist
nnoremap <Leader>va :call <SID>GrepWrapper('grep!', '', '##')<CR>

" Navigate between grep and vimgrep results
nnoremap <Leader>n :cnext<CR>zz
nnoremap <Leader>nn :cprev<CR>zz

" Jump to the results in buffers (first open window), not tabs
set switchbuf=useopen

" --- Replace ---
"----------------------------------------------------------------
" Replace the highlight in the current file
nnoremap <Leader>r :%s/<C-R>///g<Left><Left>

" Replace the highlight in the visual selection
" Flag \%V --> Match only inside the visual selection
vnoremap <Leader>r :s/\%V<C-R>/\%V//g<Left><Left>

" Replace the highlight to all loaded buffers and arglist
nnoremap <Leader>R :bufdo %s/<C-R>///ge<Left><Left><Left>

" Replace the highlight to each valid entry in the quickfix
nnoremap <Leader>Q :cdo %s/<C-R>///ge<Left><Left><Left>

" Populate the arglist
nnoremap <Leader>aa :argadd<space>
nnoremap <Leader>ad :argdelete<space>
nnoremap <Leader>an :args **/*.
nnoremap <Leader>al :call <SID>DisplayArglist()<CR>:argument<space>

"----------------------------------------------------------------
" 14. Text edition
"----------------------------------------------------------------
" Toggle case
nnoremap <Leader>z ~
vnoremap <Leader>z y:call setreg('', ToggleCase(@"), getregtype(''))<CR>gv""Pgv
vnoremap ~ y:call setreg('', ToggleCase(@"), getregtype(''))<CR>gv""Pgv

" Toggle and untoggle spell checking
let g:f8msg = 'Toggle spell checking.'
nnoremap <silent> <F8> :setlocal spell!<CR>:echo g:f8msg<CR>

" Toggle spell dictionary
nnoremap <silent> <F9> :call <SID>ToggleSpelllang()<CR>

" Move to next misspelled word
nnoremap zl ]s

" Find the misspelled word before the cursor
nnoremap zh [s

" Suggest correctly spelled words
nnoremap zp z=

" Copy text into the clipboard
vnoremap <Leader>y "+y

" Paste text from the clipboard
nnoremap <Leader>p "+p

" Quickly select the text pasted from the clipboard
nnoremap gV `[v`]

" Yank everything from the cursor to the EOL
nnoremap Y y$

" Yank the last pasted text automatically
vnoremap p pgvy

" Retab the selected text
nnoremap <Leader>tf :retab!<CR>
vnoremap <Leader>tf :retab!<CR>

" Isolate the current line
nnoremap <Leader>o m`o<Esc>kO<Esc>``

" Enter a new line Down from 'Normal Mode'
nnoremap <Leader><S-down> mao<Esc>`a

" Enter a new line Up from 'Normal Mode'
nnoremap <Leader><S-up> maO<Esc>`a

" Insert brackets and backslash faster
"  inoremap ñr []<left>
"  inoremap ñb ()<left>
"  inoremap ñB {}<left>
"  inoremap ññ \
"  inoremap çç {{  }}<left><left><left>
"  autocmd FileType html,markdown,liquid inoremap ñp {%  %}<left><left><left>

"----------------------------------------------------------------
" 15. Make settings
"----------------------------------------------------------------
" Set makeprg
if !filereadable(expand('%:p:h').'/Makefile')
  autocmd FileType c setlocal makeprg=gcc\ %\ &&\ ./a.out
endif

" Go to the error line
set errorformat=%m\ in\ %f\ on\ line\ %l

" Use the correct cursor shape via 'edit-command-line' (zle)
augroup zsh
  autocmd!
  if !has("nvim")
    autocmd Filetype zsh silent! exec "! echo -ne '\e[2 q'"
  endif
augroup end

" Run code in a tmux window
augroup tmuxy
  autocmd!
  autocmd FileType javascript,lua,perl,php,python,ruby,sh
        \ nnoremap <silent> <buffer> <Leader>ij
        \ :call <SID>Tmuxy()<CR>
augroup end

" Run code in the preview window
augroup scripty
  autocmd!
  autocmd FileType javascript,lua,perl,php,python,ruby,sh
        \ nnoremap <silent> <buffer> <Leader>ii
        \ :call <SID>Scripty()<CR>
augroup end

" Convert markdown to PDF, HTML and EPUB
augroup markdown
  autocmd!
  autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ii
        \ :call <SID>Generator('.pdf', &ft)<CR>
  autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ih
        \ :call <SID>Generator('.html', &ft)<CR>
  autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ij
        \ :call <SID>Generator('.epub', &ft)<CR>
augroup end

" Draw with PlantUML
augroup uml
  autocmd!
  autocmd FileType plantuml nnoremap <silent> <buffer> <Leader>ii
        \ :call <SID>Generator('.png', &ft)<CR>
augroup end

"----------------------------------------------------------------
" 16. Filetype settings
"----------------------------------------------------------------
" Delete trailing white spaces
func! s:DeleteTrailing()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
  echo 'Trailing white spaces have been removed.'
  noh
endfunc

nnoremap <silent> <Leader>dt :call <SID>DeleteTrailing()<CR>

" Binary
augroup binary
  autocmd!
  autocmd BufReadPre  *.bin let &bin=1
  autocmd BufReadPost *.bin if &bin | %!xxd
  autocmd BufReadPost *.bin set ft=xxd | endif
  autocmd BufWritePre *.bin if &bin | %!xxd -r
  autocmd BufWritePre *.bin endif
  autocmd BufWritePost *.bin if &bin | %!xxd
  autocmd BufWritePost *.bin set nomod | endif
augroup end

" Markdown
let g:markdown_fenced_languages = [
  \ 'python',
  \ 'sh',
  \ ]

" Mail
augroup mail
  autocmd!
  autocmd FileType mail setl spell
  autocmd FileType mail setl spelllang=ca
augroup end

" SQL (it requires sqlparse)
augroup sql
  let g:omni_sql_no_default_maps = 1
  autocmd FileType sql nnoremap <Leader>bf
        \ :%!sqlformat --reindent --keywords upper --identifiers upper -<CR>
  autocmd FileType sql vnoremap <Leader>bf
        \ :%!sqlformat --reindent --keywords upper --identifiers upper -<CR>
augroup end

" XML (it requires tidy)
augroup xml
  autocmd FileType xml nnoremap <Leader>bf
        \ :%!tidy -q -i -xml --show-errors 0 -wrap 0 --indent-spaces 4<CR>
augroup end

" MD
augroup md
  autocmd FileType markdown,liquid,text,yaml set expandtab
  autocmd FileType markdown,liquid,text nnoremap <silent> <Leader>cc :call <SID>KeywordDensity()<CR>
  autocmd FileType markdown,liquid,text nnoremap <silent> <Leader>gg g<C-g>
  autocmd FileType markdown,liquid,text vnoremap <silent> <Leader>gg g<C-g>
  autocmd FileType markdown,liquid,text nnoremap <Leader>gl :call search('\v\[[^]]*]\([^)]*\)', 'W')<CR>
  autocmd FileType markdown,liquid,text nnoremap <Leader>gh :call search('\v\[[^]]*]\([^)]*\)', 'bW')<CR>
  autocmd FileType markdown,liquid,text nnoremap <Leader>gd :call <sid>RemoveMdLink()<CR>
  autocmd FileType markdown,liquid,text :command! -range Enes <line1>,<line2>!trans en:es -brief
  autocmd FileType markdown,liquid,text :command! -range Esen <line1>,<line2>!trans es:en -brief
augroup end

" New file headers
augroup headers
  autocmd!
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\#
        \ -*- coding: utf-8 -*-\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl>\"|$
  autocmd BufNewFile *.pl 0put =\"#!/usr/bin/env perl\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
  autocmd BufNewFile *.js 0put =\"#!/usr/bin/env node\<nl>\"|$
augroup end

"----------------------------------------------------------------
" 17. Helper functions
"----------------------------------------------------------------
" Toggle Terminal
function! s:ToggleTerminal()
  if bufexists('terminal')
    call win_gotoid(s:winZsh)
    norm! i
  else
    execute ':below 10sp term://$SHELL'
    keepalt file terminal
    let s:winZsh = win_getid()
    norm! i
  endif
endfunction

" Show syntax highlighting groups
function! s:SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Rename file
function! s:RenameFile()
  let l:old_name = expand('%')
  let l:new_name = input('New file name: ', expand('%'), 'file')
  if l:new_name !=# '' && l:new_name !=# l:old_name
    exec ':saveas ' . l:new_name
    exec ':silent !rm ' . l:old_name
    redraw!
  endif
endfunction

" Don't close window when deleting a buffer
function! s:CustomCloseBuffer()
  let l:currentBufNum = bufnr('%')
  let l:alternateBufNum = bufnr('#')

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr('%') == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    exec ':bdelete! ' . l:currentBufNum
  endif
endfunction

" Close the last buffer if it's the last window
" - For 'quickfix' and 'nofile'
autocmd BufEnter * call <SID>CloseLastBuffer()
function! s:CloseLastBuffer()
  if &buftype ==# 'quickfix' || &buftype ==# 'nofile'
    if winnr('$') < 2
      quit!
    endif
  endif
endfunction

" Display the arglist vertically
function! s:DisplayArglist() abort
  let l:argnum = 0
  let l:lenargc = len(argc())
  for l:arg in argv()
    let l:argnum += 1
    let l:filename = fnamemodify(l:arg, ':t')
    let l:changed =
          \ getbufinfo(bufname('^' . l:arg . '$'))[0].changed == 1
          \ ? '+'
          \ : ' '
    let l:current = expand('%') ==# l:arg ? '%' : ' '
    echo printf( '%-*d %s%s %s',
          \ l:lenargc, l:argnum, l:current, l:changed, l:filename)
  endfor
endfunction

" Toggle maximize window and resize windows
function! s:ToggleResize() abort
  if winnr('$') > 1
    if exists('t:zoomed') && t:zoomed
      execute t:zoom_winrestcmd
      let t:zoomed = 0
      echo 'Windows resized.'
    else
      let t:zoom_winrestcmd = winrestcmd()
      resize
      vertical resize
      let t:zoomed = 1
      echo 'Window maximized.'
    endif
  endif
endfunction
autocmd VimEnter * autocmd WinEnter * let t:zoomed = 0

" Search into a Visual selection
function! s:RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
      \ '\%>'.(line("'<")-1).'l'.
      \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction

" Highlight the selected text (visual mode)
" Source: https://github.com/nelstrom/vim-visual-star-search
" (You can install it as a plugin)
function! s:VSetSearch()
  let l:temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction

" Count grep matches
function! QFCounter() abort
  let l:results = len(getqflist())
  if l:results > 0
    copen
  else
    cclose
  endif
  echo 'Found ' . l:results . ' matches.'
endfunction

" Grep wrapper
function! s:GrepWrapper(cmd, dir, scope) abort
  cclose
  let l:pattern = substitute(@/, '\\V', '', '')
  let l:pattern = substitute(pattern, '\\<', '', '')
  let l:pattern = substitute(pattern, '\\>', '', '')
  let l:pattern = escape(pattern, '"')
  let l:pattern = escape(pattern, '%')
  let l:pattern = escape(pattern, '#')
  silent execute a:cmd . ' ' . a:dir . ' "' . l:pattern . '" ' . a:scope
  redraw!
  set hlsearch
  call QFCounter()
endfunction

" Toggle case
function! ToggleCase(str)
  if a:str ==# toupper(a:str)
    let l:result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let l:result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let l:result = toupper(a:str)
  endif
  return l:result
endfunction

" Toggle spell dictionary
function! <SID>ToggleSpelllang()
  if (&spelllang =~# '^en')
    set spelllang=ca
    echo 'Català'
  elseif (&spelllang =~# '^ca')
    set spelllang=es
    echo 'Castellano'
  elseif (&spelllang =~# '^es')
    set spelllang=en_us,en_gb
    echo 'English'
  endif
  set spelllang?
endfunction

" New :windo command to return to the last current window
" - Default :windo cycles through all the open windows
" - Use 'Windo' instead of 'windo' to avoid it
command! -nargs=+ -complete=command Windo
  \ let s:currentWindow = winnr() |
  \ execute 'windo <args>' |
  \ exe s:currentWindow . 'wincmd w'

" Toggle colorcolumn
function! s:ToggleColorColumn()
  if !exists('s:color_column_old') || s:color_column_old == 0
    let s:color_column_old = &colorcolumn
    Windo let &colorcolumn = 0
  else
    Windo let &colorcolumn = s:color_column_old
    let s:color_column_old = 0
  endif
endfunction

" Toggle the cursor position start/end
function! s:ToggleCPosition(mode)
  execute a:mode
  if !exists('s:togglecp')
    let s:togglecp = 0
  endif
  if col('.') >= col('$') - 1
    let s:togglecp = 1
    norm! ^
  else
    let s:togglecp = 0
    norm! $
  endif
endfunction

" Toggle GitGutterPreviewHunk
function! s:ToggleGGPrev()
  if getwinvar(winnr('#'), '&pvw') == 1
        \ && exists('s:curr') && line(".") == s:curr
        \ || gitgutter#hunk#in_hunk(line(".")) == 0
    pclose
  else
    GitGutterPreviewHunk
    let s:curr = line(".")
  endif
endfunction

" Execute GV only once
function! s:PreventGV() abort
  if &buftype !=# 'nofile'
    execute ':GV'
  endif
endfunction

" Toggle Gstatus window
function! s:ToggleGstatus() abort
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      execute l:winnr.'close'
    else
      Git
    endif
  endfor
endfunction

" Better toggle for NERDTree
function! s:ToggleNERDTree() abort
  if bufname('%') != ""
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
      if &filetype ==# 'nerdtree'
        execute ':NERDTreeClose'
      else
        execute ':NERDTreeFocus'
      endif
    else
      execute ':NERDTreeFind'
    endif
  else
      execute ':NERDTreeToggleVCS'
  endif
endfunction

" Get Tagbar buffer name
function! s:TagbarBufName() abort
  if !exists('t:tagbar_buf_name')
    let s:buffer_seqno += 1
    let t:tagbar_buf_name = '__Tagbar__.' . s:buffer_seqno
  endif
  return t:tagbar_buf_name
endfunction

" Better toggle for Tagbar
function! s:ToggleTagbar() abort
  let tagbarwinnr = bufwinnr(s:TagbarBufName())
  if tagbarwinnr != -1
    if &modifiable
      execute tagbarwinnr 'wincmd w'
    else
      execute ':TagbarClose'
    endif
  else
    execute ':TagbarOpen'
  endif
endfunction

" Keyword density checker
function! s:KeywordDensity() abort
  silent update

  " Words count
  " > Strip the front matter, comments, HTML tags and count the words
  let s:sf = " | sed '1 { /^---/ { :a N; /\\n---/! ba; d }  }'"
  let s:sc = " | sed 's/{% comment.*endcomment %}//g'"
  let s:sh = " | sed 's/<[^>]*.//g'"
  let s:wc = " | wc -w"
  let s:get_words = system("cat " . expand('%') . s:sf. s:sc . s:sh . s:wc)
  let s:int_words = str2nr(s:get_words)
  let s:str_words = string(s:int_words)

  " Highlight count
  let s:match_count = ""
  redir => s:match_count
  silent exec '%s/' . @/ . '//gne'
  redir END

  if ! empty(s:match_count)
    let s:str_keys = split(s:match_count)[0]
    let s:flt_keys = str2float(s:str_keys)

    " Density
    let s:flt_dens = (s:flt_keys/s:int_words)*100
    let s:str_dens = string(s:flt_dens)

    echo '> ' . s:str_keys . ' of ' . s:str_words . ' (' . s:str_dens . '%)'
  else
    echo '> 0 of ' . s:str_words . ' (0%, pattern not found)'
  endif
endfunction

" Remove markdown link
function! s:RemoveMdLink() abort
  let [l, c] = searchpos('\v\[[^]]*]\([^)]*\)', 'ncW')
  if l > 0 && c > 0
    if getline(".")[col(".")-1] ==# "["
      norm! xf]vf)d
    else
      call cursor(l, c)
    endif
  endif
endfunction

"----------------------------------------------------------------
" 18. External tools integration
"----------------------------------------------------------------
" Run code into a tmux window
function! s:Tmuxy() abort
  if exists('$TMUX')
    update
    let s:runner = <SID>Runners()
    let s:cmdk = 'tmux kill-window -t run'
    let s:cmdn = 'tmux new-window -n run'
    let s:cmds = " '" . s:runner . " " . expand("%:p") . " ; read'"
    call system(s:cmdk)
    call system(s:cmdn . s:cmds)
  else
    echo 'Tmux is not running.'
  endif
endfunction

" Run code in the preview window
function! s:Scripty() abort
  update
  let s:runner = <SID>Runners()
  let s:cmd = s:runner . " " . expand("%:p")
  call <SID>Commander(s:cmd)
endfunction

" Define the runners
function! s:Runners() abort
  if &filetype =~# 'javascript'
    let s:run = 'node'
  elseif &filetype =~# 'lua'
    let s:run = 'lua'
  elseif &filetype =~# 'perl'
    let s:run = 'perl'
  elseif &filetype =~# 'php'
    let s:run = 'php'
  elseif &filetype =~# 'python'
    let s:run = 'python'
  elseif &filetype =~# 'ruby'
    let s:run = 'ruby'
  elseif &filetype =~# 'sh'
    let s:run = 'bash'
  else
    let s:run = 'empty'
  endif
  return s:run
endfunction

" Generator function
function! s:Generator(ext, ft) abort
  update
  let l:inp = expand('%')
  let l:out = expand('%:r') . a:ext
  if a:ft ==# 'markdown'
    if a:ext ==# '.html'
      let l:opt = '--mathjax '
    elseif a:ext ==# '.epub'
      let l:opt = '-t epub2 --webtex '
    elseif a:ext ==# '.pdf'
      let l:opt = '-V fontsize=12pt
            \ -V papersize=a4
            \ -V geometry:margin=2.5cm '
    endif
    let l:cmd = system('pandoc -s ' . l:opt . l:inp . ' -o ' . l:out)
  elseif a:ft ==# 'plantuml'
    let l:cmd = system('plantuml ' . l:inp . ' ' . l:out)
  elseif a:ft ==# 'dot'
    let l:cmd = system('dot -Tpng ' . l:inp . ' -o ' . l:out)
  endif
  if v:shell_error ==# 0
    pclose
    call <SID>Previewer(l:out)
  else
    call <SID>WinPreview()
    exec '0put =l:cmd'
    call <SID>ResizeWinPreview()
  endif
endfunction

" Preview outputs (EPUB, PDF, HTML, PNG) with mupdf
function! s:Previewer(out) abort
  let l:dev = ' 2>/dev/null'
  let l:checkps = system('ps -ef
        \ | grep -v grep
        \ | grep mupdf
        \ | grep -o ' . a:out . l:dev)
  if l:checkps ==# ''
    call system('mupdf ' . a:out . ' &')
  else
    call system('pkill -HUP mupdf')
  endif
endfunction

" Window previewer
function! s:WinPreview() abort
  silent! wincmd P
  if !&previewwindow
    exec 'new'
    setlocal previewwindow
    setlocal buftype=nowrite bufhidden=wipe
    setlocal nobuflisted noswapfile nowrap
    nnoremap <silent> <buffer> q :pclose<CR>
  endif
  exec '%delete'
endfunction

" Commander
function! s:Commander(cmd) abort
  call <SID>WinPreview()
  exec '0read !' . a:cmd
  call <SID>ResizeWinPreview()
endfunction

" Resize the preview window
function! s:ResizeWinPreview() abort
  exec '$d'
  let s:size = line('$')
  if s:size < 11
    exec 'resize ' . line('$')
  else
    exec 'resize 10'
  endif
  norm! gg
  wincmd p
endfunction

command! -nargs=1 Commander call <SID>Commander(<f-args>)
