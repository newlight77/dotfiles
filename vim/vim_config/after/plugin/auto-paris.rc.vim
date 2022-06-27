"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-pairs settings
" Maps for normal and insert modes
let g:AutoPairs = {'(':')', '[':']', '{':'}', '<':'>',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsParens = {'(':')', '[':']', '{':'}', '<':'>'}
let g:AutoPairsFlyMode        = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump   = '<C-z>'
let g:AutoPairsShortcutToggle = '<C-q>'

" Workaround to fix an Auto-pairs bug until it gets fixed
if has("nvim")
  autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
endif