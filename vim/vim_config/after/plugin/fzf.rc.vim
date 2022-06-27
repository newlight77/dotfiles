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
