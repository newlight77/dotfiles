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
  