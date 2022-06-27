"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neosnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup all
    autocmd InsertLeave * NeoSnippetClearMarkers
augroup end


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