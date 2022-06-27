"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JS-Beautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:config_Beautifier = {}
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].indent_style = 'tab'
let g:config_Beautifier['jsx'] = {}
let g:config_Beautifier['jsx'].indent_style = 'tab'
let g:config_Beautifier['json'] = {}
let g:config_Beautifier['json'].indent_style = 'tab'
let g:config_Beautifier['css'] = {}
let g:config_Beautifier['css'].indent_style = 'tab'
let g:config_Beautifier['html'] = {}
let g:config_Beautifier['html'].indent_style = 'tab'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => JS-Beautify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS-Beautify
augroup beautify
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <Leader>bf :call JsBeautify()<cr>
    autocmd FileType javascript vnoremap <buffer> <Leader>bf :call RangeJsBeautify()<cr>
    autocmd FileType json nnoremap <buffer> <Leader>bf :call JsonBeautify()<cr>
    autocmd FileType json vnoremap <buffer> <Leader>bf :call RangeJsonBeautify()<cr>
    autocmd FileType jsx nnoremap <buffer> <Leader>bf :call JsxBeautify()<cr>
    autocmd FileType jsx vnoremap <buffer> <Leader>bf :call RangeJsxBeautify()<cr>
    autocmd FileType html nnoremap <buffer> <Leader>bf :call HtmlBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <Leader>bf :call RangeHtmlBeautify()<cr>
    autocmd FileType css nnoremap <buffer> <Leader>bf :call CSSBeautify()<cr>
    autocmd FileType css vnoremap <buffer> <Leader>bf :call RangeCSSBeautify()<cr>
augroup end