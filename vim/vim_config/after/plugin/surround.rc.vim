"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Surround settings
" Use 'yss?', 'yss%' or 'yss=' to surround a line
autocmd FileType php let b:surround_{char2nr('p')} = "<?php \r ?>"
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('p')} = "{% \r %}"
autocmd FileType markdown,liquid let b:surround_{char2nr('i')} = "_\r_"
autocmd FileType markdown,liquid let b:surround_{char2nr('o')} = "**\r**"
autocmd FileType markdown,liquid let b:surround_{char2nr('x')} = "«\r»"
autocmd FileType markdown,liquid let b:surround_{char2nr('h')} = "\[\r\]\(//\)"
autocmd FileType markdown,liquid let b:surround_{char2nr('j')} = "!\[\r\]
      \\(/images/\){: .align-}"
autocmd FileType markdown,liquid let b:surround_{char2nr('e')} = "\[\r\]
      \\(\){:rel=\"noopener noreferrer\" target=\"_blank\"}"
autocmd FileType markdown,liquid let b:surround_{char2nr('y')} = "<a href=\"\"
      \ rel=\"noopener noreferrer\" target=\"_blank\">\r<\/a>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>
