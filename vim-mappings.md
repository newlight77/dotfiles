### Vim Cheat Sheet

In progress...
gt : next tab
gT : previous tab
1gt : goto tab number 1
2gt : goto tab number 2
ngt : goto tab number n
F3 : open NERD Tree
F7 : toggle Terminal

yy : copy line
2yy : copy 2lines
ga : show Unicode character
,z : toggle case
,j : GitGutterNextHunk
,k : GitGutterPrevHunk
,ga : GitGutterStageHunk
,gu : GitGutterUndoHunk
cc : toggle nerd comment
gcc : toggle nerd comment
ctrl+s : ToggleGstatus
ctrl+b : OpenSession
ctrl+t : ToggleTagbar
,h : next error
,l : previous error

### Custom Mappings


| Context  | Shortcuts  | Plugin | Action| Description |
| nmap     | <Leader>j  |  |  | |
| nmap     | <Leader>k  |  |  | |
| nnoremap | <Leader>cc |  NERDComment | selection lines of code | Toggle comment |
| nmap     | ga         | characterize.vim | position on a charater | Unicode character : U+00A9 COPYRIGHT SYMBOL |
| nnoremap | <F7> | Terminal |  | ToggleTerminal |


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
nnoremap <Leader>n mao<Esc>`a

" Enter a new line Up from 'Normal Mode'
nnoremap <Leader>N maO<Esc>`a

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


" Split windows
map <Leader>, <C-w>
map <C-w>- :split<CR>
map <C-w>. :vsplit<CR>
nnoremap <silent> <C-w>p :wincmd w<CR>:echo "Previous window."<CR>
nnoremap <silent> <C-w>n :wincmd W<CR>:echo "Next window."<CR>


" Open a new tab with the current buffer's path
" Useful when editing files in the same directory
nnoremap <Leader>tt :tabedit <C-R>=expand("%:p:h")<CR>/

" Create and close tabs
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>

" Move tabs position
nnoremap <Leader>tr :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Leader>ty :execute 'silent! tabmove ' . tabpagenr()<CR>


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

" Save all buffers
nnoremap <Leader>S :bufdo update<CR>

" Save the current buffer
nnoremap <Leader>s :update<CR>

" Reload a file when it is changed from the outside
let g:f5msg = 'Buffer reloaded.'
nnoremap <F5> :e<CR>:echo g:f5msg<CR>

" Rename file
nnoremap <F2> :call <SID>RenameFile()<CR>



" Show syntax highlighting groups
nnoremap <Leader>B :call <SID>SynStack()<CR>


nnoremap <F11> :Goyo<CR>


nnoremap <Leader>we :VimwikiToggleListItem<CR>
vnoremap <Leader>we :VimwikiToggleListItem<CR>

" Open-browser settings
nmap <Leader>gl <Plug>(openbrowser-open)


nnoremap <Leader>W :ArgWrap<CR>


" Easy align settings
xmap gi <Plug>(EasyAlign)
nmap gi <Plug>(EasyAlign)

" Tabularize (e.g. /= or /:)
vnoremap <Leader>x :Tabularize /

" Tabularize only the first match on the line (e.g. /=.*/)
vnoremap <Leader>X :Tabularize /.*/<Left><Left><Left>


nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)


" Undotree toggle
nnoremap <Leader>u :UndotreeToggle<CR>
