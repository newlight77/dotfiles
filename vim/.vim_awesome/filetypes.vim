""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif


""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html


""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1

" Markdown
let g:markdown_fenced_languages = [
  \ 'python',
  \ 'sh',
  \ ]

" Remove markdown link
function! s:RemoveMdLink() abort
    let [l, c] = searchpos('\v\[[^]]*]\([^)]*\)', 'ncW')
    if l > 0 && c > 0
      if getline(".")[col(".")-1] ==# "["
        norm! xf]vf)d
      else
        call cursor(l, c)
      endif
    endif
endfunction


" Define the runners
function! s:Runners() abort
    if &filetype =~# 'javascript'
      let s:run = 'node'
    elseif &filetype =~# 'lua'
      let s:run = 'lua'
    elseif &filetype =~# 'perl'
      let s:run = 'perl'
    elseif &filetype =~# 'php'
      let s:run = 'php'
    elseif &filetype =~# 'python'
      let s:run = 'python'
    elseif &filetype =~# 'ruby'
      let s:run = 'ruby'
    elseif &filetype =~# 'sh'
      let s:run = 'bash'
    else
      let s:run = 'empty'
    endif
    return s:run
  endfunction

""""""""""""""""""""""""""""""
" => Run commands
""""""""""""""""""""""""""""""
func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %"
elseif &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
elseif &filetype == 'html'
    exec "!google-chrome % &"
elseif &filetype == 'go'
    exec "!go build %<"
    exec "!time go run %"
elseif &filetype == 'matlab'
    exec "!time octave %"
endif
endfunc


""""""""""""""""""""""""""""""
" => Binary
""""""""""""""""""""""""""""""
augroup binary
    autocmd!
    autocmd BufReadPre  *.bin let &bin=1
    autocmd BufReadPost *.bin if &bin | %!xxd
    autocmd BufReadPost *.bin set ft=xxd | endif
    autocmd BufWritePre *.bin if &bin | %!xxd -r
    autocmd BufWritePre *.bin endif
    autocmd BufWritePost *.bin if &bin | %!xxd
    autocmd BufWritePost *.bin set nomod | endif
augroup end


""""""""""""""""""""""""""""""
" => XML (it requires tidy)
""""""""""""""""""""""""""""""
augroup xml
    autocmd FileType xml nnoremap <Leader>bf
          \ :%!tidy -q -i -xml --show-errors 0 -wrap 0 --indent-spaces 4<CR>
augroup end


""""""""""""""""""""""""""""""
" => New file headers
""""""""""""""""""""""""""""""
augroup headers
    autocmd!
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\#
          \ -*- coding: utf-8 -*-\<nl>\"|$
    autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl>\"|$
    autocmd BufNewFile *.pl 0put =\"#!/usr/bin/env perl\<nl>\"|$
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
    autocmd BufNewFile *.js 0put =\"#!/usr/bin/env node\<nl>\"|$
augroup end
