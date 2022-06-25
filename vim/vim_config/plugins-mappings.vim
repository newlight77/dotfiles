

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""

map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-S-p> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <C-n> :NERDTree<CR>
nnoremap <F3> :NERDTreeToggle<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


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
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>a <Plug>(ale_next_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>d :GitGutterToggle<cr>
nnoremap <silent> <C-g> :call <SID>ToggleGGPrev()<CR>zz
nmap <Leader>j <Plug>(GitGutterNextHunk)zz
nmap <Leader>k <Plug>(GitGutterPrevHunk)zz
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy the link to the line of a Git repository to the clipboard
nnoremap <leader>v :.GBrowse!<CR>
xnoremap <leader>v :'<'>GBrowse!<CR>
nnoremap <C-s> :call <SID>ToggleGstatus()<CR>
nnoremap <Leader>gv :Gvdiffsplit<CR>:windo set wrap<CR>
nnoremap <Leader>gh :Gvdiffsplit HEAD<CR>:windo set wrap<CR>
nnoremap <Leader>gb :Gblame<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GV-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GV settings
nnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>
vnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>

" Execute GV only once
function! s:PreventGV() abort
if &buftype !=# 'nofile'
    execute ':GV'
endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run code in a tmux window
augroup tmuxy
  autocmd!
  autocmd FileType javascript,lua,perl,php,python,ruby,sh
        \ nnoremap <silent> <buffer> <Leader>ij
        \ :call <SID>Tmuxy()<CR>
augroup end


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>cp
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-session settings
nnoremap <C-b> :OpenSession<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter settings
nnoremap cc :call NERDComment(0,'toggle')<CR>
vnoremap cc :call NERDComment(0,'toggle')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF settings
let $FZF_PREVIEW_COMMAND = 'cat {}'
nnoremap <C-f><C-f> :Files<CR>
nnoremap <C-f><C-g> :Commits<CR>
nnoremap <C-f><Space> :BLines<CR>

" Navigate between errors
nnoremap <Leader>h :lprevious<CR>zz
nnoremap <Leader>l :lnext<CR>zz


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar toggle (custom function)
let g:ctmsg = 'Toggle Tagbar.'
nnoremap <silent> <C-t> :call <SID>ToggleTagbar()<CR>:echo g:ctmsg<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree toggle
nnoremap <Leader>u :UndotreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JS-Beautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS-Beautify
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC (Conquer of completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete settings
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Caps Lock settings
imap <expr><C-l> deoplete#smart_close_popup()."\<Plug>CapsLockToggle"
cmap <silent> <C-l> <Plug>CapsLockToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neosnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy align settings
xmap gi <Plug>(EasyAlign)
nmap gi <Plug>(EasyAlign)

" Tabularize (e.g. /= or /:)
vnoremap <Leader>x :Tabularize /

" Tabularize only the first match on the line (e.g. /=.*/)
vnoremap <Leader>X :Tabularize /.*/<Left><Left><Left>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Expand-region
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Expand region settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ArgWrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ArgWrap settings
nnoremap <Leader>W :ArgWrap<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open-browser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gl <Plug>(openbrowser-open)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>we :VimwikiToggleListItem<CR>
vnoremap <Leader>we :VimwikiToggleListItem<CR>


