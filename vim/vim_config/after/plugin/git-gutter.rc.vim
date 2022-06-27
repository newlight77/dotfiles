"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
let g:gitgutter_max_signs             = 5000
let g:gitgutter_sign_added            = '+'
let g:gitgutter_sign_modified         = '»'
let g:gitgutter_sign_removed          = '_'
let g:gitgutter_sign_modified_removed = '»╌'
let g:gitgutter_map_keys              = 0
let g:gitgutter_diff_args             = '--ignore-space-at-eol'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>d :GitGutterToggle<cr>
nnoremap <silent> <C-g> :call <SID>ToggleGGPrev()<CR>zz
nmap <Leader>j <Plug>(GitGutterNextHunk)zz
nmap <Leader>k <Plug>(GitGutterPrevHunk)zz
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>


" Toggle GitGutterPreviewHunk
function! s:ToggleGGPrev()
    if getwinvar(winnr('#'), '&pvw') == 1
          \ && exists('s:curr') && line(".") == s:curr
          \ || gitgutter#hunk#in_hunk(line(".")) == 0
      pclose
    else
      GitGutterPreviewHunk
      let s:curr = line(".")
    endif
endfunction
