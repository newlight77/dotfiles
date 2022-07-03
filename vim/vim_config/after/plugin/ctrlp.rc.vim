""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_max_height = 20

" CtrlP settings
let g:ctrlp_map                 = '<C-p>'
let g:ctrlp_cmd                 = 'CtrlPBuffer'
let g:ctrlp_working_path_mode   = 'rc'
let g:ctrlp_custom_ignore       = '\v[\/]\.(git|hg|svn)$|node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
"  let g:ctrlp_custom_ignore       = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:10,results:85'
let g:ctrlp_show_hidden         = 1
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_open_multiple_files = '0i'
let g:ctrlp_prompt_mappings     = {
  \ 'PrtHistory(1)'        : [''],
  \ 'PrtHistory(-1)'       : [''],
  \ 'ToggleType(1)'        : ['<C-l>', '<C-up>'],
  \ 'ToggleType(-1)'       : ['<C-h>', '<C-down>'],
  \ 'PrtCurLeft()'         : ['<C-b>', '<Left>'],
  \ 'PrtCurRight()'        : ['<C-f>', '<Right>'],
  \ 'PrtBS()'              : ['<C-s>', '<BS>'],
  \ 'PrtDelete()'          : ['<C-d>', '<DEL>'],
  \ 'PrtDeleteWord()'      : ['<C-w>'],
  \ 'PrtClear()'           : ['<C-u>'],
  \ 'PrtClearCache()'      : ['<C-r>'],
  \ 'ToggleByFname()'      : ['<C-g>'],
  \ 'ToggleFocus()'        : ['<tab>'],
  \ 'AcceptSelection("e")' : ['<C-m>', '<CR>'],
  \ 'AcceptSelection("h")' : ['<C-x>'],
  \ 'AcceptSelection("t")' : ['<C-t>'],
  \ 'AcceptSelection("v")' : ['<C-v>'],
  \ 'OpenMulti()'          : ['<C-o>'],
  \ 'MarkToOpen()'         : ['<c-z>'],
  \ 'PrtExit()'            : ['<esc>', '<c-c>', '<c-p>'],
  \ }


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>p :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>
