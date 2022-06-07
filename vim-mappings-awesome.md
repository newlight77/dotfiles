### Custom Mappings

In progress...


" Reload .vimrc
nnoremap <F12> :so $MYVIMRC<CR>

" Leader key to add extra key combinations
let mapleader = ','
let g:mapleader = ','

" Trigger InsertLeave autocmd
inoremap <C-c> <Esc>

" No need for Ex mode
nnoremap Q <NOP>

" Terminal (nvim)
if has("terminal") && has("nvim")
  nnoremap <silent> <F7> :call <SID>ToggleTerminal()<CR>
  tnoremap <silent> <F7> <C-\><C-n><Bar>:wincmd p<CR>
  tnoremap <Esc> <C-\><C-n>
endif

" Git-gutter
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

" vim-session
nnoremap <C-b> :OpenSession<CR>

" NERDComment
nnoremap cc :call NERDComment(0,'toggle')<CR>
vnoremap cc :call NERDComment(0,'toggle')<CR>

" NERDTree ---------------------------------------------
nnoremap <silent> <C-n> :call <SID>ToggleNERDTree()<CR>

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" FZF settings
nnoremap <C-f><C-f> :Files<CR>
nnoremap <C-f><C-g> :Commits<CR>
nnoremap <C-f><Space> :BLines<CR>

" Navigate between errors
nnoremap <Leader>h :lprevious<CR>zz
nnoremap <Leader>l :lnext<CR>zz

" Tagbar toggle (custom function)
nnoremap <silent> <C-t> :call <SID>ToggleTagbar()<CR>

" Undo tree toggle
nnoremap <Leader>u :UndotreeToggle<CR>

" CtrlP
let g:ctrlp_map                 = '<C-p>'
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


" beautify
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

" Conquer of completion ---------------------------------------------
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

" emmet-vim ---------------------------------------------
let g:user_emmet_leader_key='<Tab>'

" Deoplete settings
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" --- Snippets ---
" Neosnippet settings
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)

" For conceal markers
if has('conceal')
  set conceallevel=0 concealcursor=niv
  nnoremap <silent> coi :set conceallevel=0<CR>:set concealcursor=niv<CR>
  nnoremap <silent> coo :set conceallevel=2<CR>:set concealcursor=vc<CR>
  nnoremap <silent> cop :set conceallevel=2<CR>:set concealcursor=niv<CR>
  nnoremap <silent> com :set conceallevel=3<CR>:set concealcursor=niv<CR>
endif

" Easy align settings
xmap gi <Plug>(EasyAlign)
nmap gi <Plug>(EasyAlign)

" Tabularize (e.g. /= or /:)
vnoremap <Leader>x :Tabularize /
" Tabularize only the first match on the line (e.g. /=.*/)
vnoremap <Leader>X :Tabularize /.*/<Left><Left><Left>

" Auto-pairs settings
let g:AutoPairsShortcutJump   = '<C-z>'
let g:AutoPairsShortcutToggle = '<C-q>'

" Caps Lock settings
imap <expr><C-l> deoplete#smart_close_popup()."\<Plug>CapsLockToggle"
cmap <silent> <C-l> <Plug>CapsLockToggle

" Expand region settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ArgWrap settings
nnoremap <Leader>W :ArgWrap<CR>

" Open-browser settings
nmap <Leader>gl <Plug>(openbrowser-open)

" Goyo settings
nnoremap <F11> :Goyo<CR>

" Vimwiki settings
nnoremap <Leader>we :VimwikiToggleListItem<CR>
vnoremap <Leader>we :VimwikiToggleListItem<CR>

" Show syntax highlighting groups
nnoremap <Leader>B :call <SID>SynStack()<CR>

" Reload a file when it is changed from the outside
nnoremap <F5> :e<CR>:echo g:f5msg<CR>

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

"----------------------------------------------------------------
" 8. Tabs management
"----------------------------------------------------------------
" Create and close tabs
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>

" Open a new tab with the current buffer's path
" Useful when editing files in the same directory
nnoremap <Leader>tt :tabedit <C-R>=expand("%:p:h")<CR>/

" Move tabs position
nnoremap <Leader>tr :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Leader>ty :execute 'silent! tabmove ' . tabpagenr()<CR>


"----------------------------------------------------------------
" 9. Multiple windows
"----------------------------------------------------------------
" Remap wincmd
map <Leader>, <C-w>

" Split windows
map <C-w>- :split<CR>
map <C-w>. :vsplit<CR>
map <C-w>j :close<CR>
map <C-w>x :q!<CR>
map <C-w>, <C-w>=

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


" IndentLine ---------------------------------------------
nnoremap <TAB> >>
nnoremap <S-TAB> <<

vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

inoremap <TAB> <C-i>
inoremap <S-TAB> <C-d>


" Color column
nnoremap <silent> <F10> :call <SID>ToggleColorColumn()<CR>:echo g:f10msg<CR>

" Toggle line numbers
nnoremap <silent> <F3> :set number!<CR>:echo g:f3msg<CR>

" Toggle relative line numbers
nnoremap <silent> <F4> :set norelativenumber!<CR>:echo g:f4msg<CR>


" Treat long lines as break lines (useful when moving around in them)
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

vnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')

nnoremap <Home> g^
nnoremap <End> g$

vnoremap <Home> g^
vnoremap <End> g$

" Toggle the cursor position start/end of the line
nnoremap <silent> ñ :call <SID>ToggleCPosition('')<CR>
vnoremap <silent> ñ <Esc>:call <SID>ToggleCPosition('normal! gv')<CR>

" Join / split lines
nnoremap <C-j> J
nnoremap <C-k> i<CR><Esc>

" Duplicate a line
nnoremap cx yyP
nnoremap cv yyp


" Move the cursor to the line start
inoremap <C-a> <C-O>0

" Move the cursor to the line end
inoremap <C-e> <C-O>$

" Moves the cursor back one character
inoremap <expr><C-b> deoplete#smart_close_popup()."\<Left>"

" Moves the cursor forward one character
inoremap <expr><C-f> deoplete#smart_close_popup()."\<Right>"

" Remove one character
inoremap <C-d> <DEL>

" Command Mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <DEL>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-v> <C-r>"
cnoremap <C-q> <S-Right><C-w>


" Allow moving one or multiple lines ===============
nmap <silent> <S-up> :call MoveLines('-2')<CR>
nmap <silent> <S-down> :call MoveLines('+1')<CR>
vmap <silent> <S-up> :call MoveLines('-2')<CR>gv
vmap <silent> <S-down> :call MoveLines('+1')<CR>gv


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
" Vimgrep the highlight in the current file
nnoremap <Leader>vg :vimgrep /<C-R>//j %<CR>

" Vimgrep the highlight in the current directory and subdirectories
nnoremap <Leader>vf :vimgrep /<C-R>//j **/*.

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
nnoremap <Leader>N :cprev<CR>zz

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
nnoremap <Leader>ad :arpdelete<space>
nnoremap <Leader>an :args **/*.
nnoremap <Leader>al :call <SID>DisplayArglist()<CR>:argument<space>

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
nnoremap <Leader>f mao<Esc>`a

" Enter a new line Up from 'Normal Mode'
nnoremap <Leader>F maO<Esc>`a

" Insert brackets and backslash faster
inoremap ñr []<left>
inoremap ñb ()<left>
inoremap ñB {}<left>
inoremap ññ \
inoremap çç {{  }}<left><left><left>
autocmd FileType html,markdown,liquid inoremap ñp {%  %}<left><left><left>

" Run code in a tmux window
nnoremap <silent> <buffer> <Leader>ij

" Run code in the preview window
nnoremap <silent> <buffer> <Leader>ii

" Convert markdown to PDF, HTML and EPUB
autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ii
      \ :call <SID>Generator('.pdf', &ft)<CR>
autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ih
      \ :call <SID>Generator('.html', &ft)<CR>
autocmd FileType markdown nnoremap <silent> <buffer> <Leader>ij
      \ :call <SID>Generator('.epub', &ft)<CR>

" Draw with PlantUML
autocmd FileType plantuml nnoremap <silent> <buffer> <Leader>ii
        \ :call <SID>Generator('.png', &ft)<CR>

" Delete trailing white spaces
nnoremap <silent> <Leader>dt :call <SID>DeleteTrailing()<CR>