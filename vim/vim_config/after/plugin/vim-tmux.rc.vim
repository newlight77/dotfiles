"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-tmux navigator settings
let g:tmux_navigator_no_mappings = 1


"----------------------------------------------------------------
" => Tmux 
"----------------------------------------------------------------
" Run code into a tmux window
function! s:Tmuxy() abort
    if exists('$TMUX')
      update
      let s:runner = <SID>Runners()
      let s:cmdk = 'tmux kill-window -t run'
      let s:cmdn = 'tmux new-window -n run'
      let s:cmds = " '" . s:runner . " " . expand("%:p") . " ; read'"
      call system(s:cmdk)
      call system(s:cmdn . s:cmds)
    else
      echo 'Tmux is not running.'
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run code in a tmux window
augroup tmuxy
  autocmd!
  autocmd FileType javascript,lua,perl,php,python,ruby,sh
        \ nnoremap <silent> <buffer> <Leader>ij
        \ :call <SID>Tmuxy()<CR>
augroup end