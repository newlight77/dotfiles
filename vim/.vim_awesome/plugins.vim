"----------------------------------------------------------------
" Install Plugins (Plug)
"----------------------------------------------------------------
" List of plugins installed
call plug#begin('~/.vim/plugged')

  Plug 'neovim/nvim-lspconfig'
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

  " Search
  Plug 'mileszs/ack.vim'

  " Commenting
  Plug 'preservim/nerdcommenter', { 'commit': 'a5d1663' }
  Plug 'tpope/vim-commentary'
  Plug 'suy/vim-context-commentstring'

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
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'honza/vim-snippets'

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
  Plug 'kchmck/vim-coffee-script'
  Plug 'groenewege/vim-less'

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


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_max_height = 20

" CtrlP settings
let g:ctrlp_map                 = '<C-p>'
let g:ctrlp_cmd                 = 'CtrlPBuffer'
let g:ctrlp_working_path_mode   = 'rc'
let g:ctrlp_custom_ignore       = '\v[\/]\.(git|hg|svn)$|node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
"  let g:ctrlp_custom_ignore       = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
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
""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
let g:snipMate = { 'snippet_version' : 1 }


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=35
let g:NERDTreeShowHidden        = 1
let g:NERDTreeDirArrows         = 1
let g:NERDTreeShowIcons         = 1
let g:NERDTreeShowLineNumbers   = 1
let g:NERDTreeSortDirectories   = 1
let g:NERDTreeSmartOpen         = 1
let g:NERDTreeIgnoreVCS         = 1

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.pyc$', '__pycache__', '\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

"close NERDtree if that is the last window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" don't quit NERDTree after opening a buffer
let NERDTreeQuitOnOpen = 1

"Open NERDtree automatically on vim startup
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
augroup DIRCHANGE
  au!
  autocmd DirChanged global :NERDTreeCWD
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
let g:gitgutter_max_signs             = 5000
let g:gitgutter_sign_added            = '+'
let g:gitgutter_sign_modified         = '»'
let g:gitgutter_sign_removed          = '_'
let g:gitgutter_sign_modified_removed = '»╌'
let g:gitgutter_map_keys              = 0
let g:gitgutter_diff_args             = '--ignore-space-at-eol'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EditorConfig (project-specific EditorConfig rule)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-session settings
let g:session_autosave  = 'no'
let g:session_autoload  = 'no'
let g:session_directory = '~/.vim/sessions/'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDDefaultAlign          = 'left'
let g:NERDSpaceDelims           = 1
let g:NERDCompactSexyComs       = 1
let g:NERDCommentEmptyLines     = 0
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters      = {
  \ 'python': {'left': '#'},
  \ }


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

" Listtoggle settings
let g:lt_location_list_toggle_map = '<leader>e'
let g:lt_quickfix_list_toggle_map = '<leader>q'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar toggle (custom function)
let g:tagbar_autofocus        = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_sort             = 0




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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JS-Beautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC (Conquer of completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => emmet-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - «Deoplete requires Neovim with Python3 enabled»
let g:python3_host_prog       = '/usr/bin/python3'
let g:python3_host_skip_check = 1

autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#functions    = {}
call deoplete#custom#option('auto_complete_delay', 250)


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neosnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup all
  autocmd InsertLeave * NeoSnippetClearMarkers
augroup end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.html.erb,*.md'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MatchTagAlways
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MatchTagAlways settings
let g:mta_filetypes = {
  \ 'html'  : 1,
  \ 'xhtml' : 1,
  \ 'xml'   : 1,
  \ 'jinja' : 1,
  \ 'php'   : 1,
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ArgWrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ArgWrap settings
let g:argwrap_tail_comma    = 1
let g:argwrap_padded_braces = '[{'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-move
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-move settings. Use Shift
let g:move_key_modifier = 'S'
let g:move_key_modifier_visualmode = 'S'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-tmux navigator settings
let g:tmux_navigator_no_mappings = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open-browser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open-browser settings
let g:openbrowser_browser_commands = [{
  \ 'name': 'w3m',
  \ 'args': 'tmux new-window w3m {uri}',
  \ }]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo settings
let g:goyo_width  = "80"
let g:goyo_height = "100%"
let g:goyo_linenr = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => IndentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"----------------------------------------------------------------
" => Tmux 
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


" Configure a sqlite database
function! s:SqliteDatabase() abort
  let t:path = input('Database: ')
endfunction

" Execute SQL queries
function! s:SQLExec(opt) abort
  if a:opt ==# 'n'
    silent norm! yy
  elseif a:opt ==# 'v'
    silent norm! gvy
  endif
  if !exists('t:path')
    call <SID>SqliteDatabase()
  endif
  if filereadable(t:path)
    let t:sql = @
    let t:sql = substitute(t:sql, '\n', ' ', 'g')
    let t:format = " | column -t -s '|'"
    if t:sql =~? '^select'
      let t:cmd = t:path . ' "' . escape(t:sql, '"') . '"' . t:format
    else
      let t:cmd = t:path . ' "' . escape(t:sql, '"') . '"'
    endif
    let s:cmd = "sqlite3 -list -batch " . t:cmd
    call <SID>Commander(s:cmd)
  else
    echo "\nThis database does not exist!"
  endif
endfunction

" Execute Maxima instructions
function! s:MaximaExec(opt) abort
  if a:opt ==# 'n'
    silent norm! yy
  elseif a:opt ==# 'v'
    silent norm! gvy
  endif
  let b:equ = @
  let b:equ = substitute(b:equ, '\n', ' ', 'g')
  let b:equ = substitute(b:equ, '\s$', '', 'g')
  let b:equ = substitute(b:equ, '%', '\\%', 'g')
  if b:equ !~# ';$'
    let b:equ = substitute(b:equ, '$', ';', 'g')
  endif
  let s:cmd = 'maxima --very-quiet --batch-string "' . b:equ . '"'
  call <SID>Commander(s:cmd)
endfunction


" Toggle jekyll server in the background
function! s:ToggleJekyll() abort
  call system('lsof -i :4000 | grep -i listen')
  if v:shell_error
    silent exec "!(bundle exec jekyll serve &) > /dev/null"
    call system("touch /tmp/jekyll.ps")
    call system("notify-send -t 2 'Executing Jekyll server...'")
  else
    silent exec "!(pkill -f jekyll &) > /dev/null"
    call system("rm -f /tmp/jekyll.ps")
    call system("notify-send -t 2 'Jekyll server was stoped!'")
  endif
  redraw!
endfunction
