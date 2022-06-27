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
