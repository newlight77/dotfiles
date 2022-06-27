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
" => CoC (Conquer of completion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)