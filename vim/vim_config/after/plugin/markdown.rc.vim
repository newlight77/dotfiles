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