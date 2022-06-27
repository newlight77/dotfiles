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
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <C-n> :NERDTree<CR>
nnoremap <F3> :NERDTreeToggle<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
