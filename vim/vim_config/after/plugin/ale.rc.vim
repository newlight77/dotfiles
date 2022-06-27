"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_linters = {
  \ 'c'          : ['clang'],
  \ 'vim'        : ['vint'],
  \ 'python'     : ['flake8','pylint'],
  \ 'javascript' : ['eslint'],
  \ 'typescript' : ['eslint'],
  \ 'css'        : ['csslint'],
  \ 'tex'        : ['chktex'],
  \ 'go'         : ['go', 'golint', 'errcheck']
  \ }
"let g:ale_javascript_eslint_executable='npx eslint'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>a <Plug>(ale_next_wrap)
