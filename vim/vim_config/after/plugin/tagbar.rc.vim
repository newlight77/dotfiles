"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar toggle (custom function)
let g:tagbar_autofocus        = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_sort             = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar toggle (custom function)
let g:ctmsg = 'Toggle Tagbar.'
nnoremap <silent> <C-t> :call <SID>ToggleTagbar()<CR>:echo g:ctmsg<CR>




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
  