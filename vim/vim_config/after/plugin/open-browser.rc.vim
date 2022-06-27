"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open-browser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open-browser settings
let g:openbrowser_browser_commands = [{
  \ 'name': 'w3m',
  \ 'args': 'tmux new-window w3m {uri}',
  \ }]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open-browser
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gl <Plug>(openbrowser-open)
