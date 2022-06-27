
""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript,typescript inoremap <buffer> $r return 
au FileType javascript,typescript inoremap <buffer> $f // --- PH<esc>FP2xi
au FileType javascript,typescript imap <C-t> console.log();<esc>hi
au FileType javascript,typescript imap <C-a> alert();<esc>hi


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup md
    autocmd FileType markdown,liquid,text,yaml set expandtab
    autocmd FileType markdown,liquid,text nnoremap <silent> <Leader>cc :call <SID>KeywordDensity()<CR>
    autocmd FileType markdown,liquid,text nnoremap <silent> <Leader>gg g<C-g>
    autocmd FileType markdown,liquid,text vnoremap <silent> <Leader>gg g<C-g>
    autocmd FileType markdown,liquid,text nnoremap <Leader>gl :call search('\v\[[^]]*]\([^)]*\)', 'W')<CR>
    autocmd FileType markdown,liquid,text nnoremap <Leader>gh :call search('\v\[[^]]*]\([^)]*\)', 'bW')<CR>
    autocmd FileType markdown,liquid,text nnoremap <Leader>gd :call <sid>RemoveMdLink()<CR>
    autocmd FileType markdown,liquid,text :command! -range Enes <line1>,<line2>!trans en:es -brief
    autocmd FileType markdown,liquid,text :command! -range Esen <line1>,<line2>!trans es:en -brief
augroup end
