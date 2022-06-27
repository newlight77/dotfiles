"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki settings
let g:vimwiki_url_maxsave   = 0
let g:vimwiki_global_ext    = 0
let g:vimwiki_syntax        = 'markdown'
let g:vimwiki_list          = [
  \ {'path': '~/Workspace/vimwiki'},
  \ {'path': '~/Workspace/vimwiki/Articles'},
  \ {'path': '~/Workspace/vimwiki/Codes'},
  \ {'path': '~/Workspace/vimwiki/Notes'},
  \ {'path': '~/Workspace/vimwiki/Projects'},
  \ {'path': '~/Workspace/vimwiki/Studies'},
  \ {'path': '~/Workspace/vimwiki/ToDos'},
  \ {'path': '~/Workspace/vimwiki/Unix'}
  \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>we :VimwikiToggleListItem<CR>
vnoremap <Leader>we :VimwikiToggleListItem<CR>
