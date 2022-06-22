"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
  let g:cmd = getcmdline()

  if has("win16") || has("win32")
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  endif

  if g:cmd == g:cmd_edited
      if has("win16") || has("win32")
          let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
      else
          let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
      endif
  endif

  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun


" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
      return 'PASTE MODE  '
  endif
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
      buffer #
  else
      bnext
  endif

  if bufnr("%") == l:currentBufNum
      new
  endif

  if buflisted(l:currentBufNum)
      execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
      call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Grep wrapper
function! s:GrepWrapper(cmd, dir, scope) abort
  cclose
  let l:pattern = substitute(@/, '\\V', '', '')
  let l:pattern = substitute(pattern, '\\<', '', '')
  let l:pattern = substitute(pattern, '\\>', '', '')
  let l:pattern = escape(pattern, '"')
  let l:pattern = escape(pattern, '%')
  let l:pattern = escape(pattern, '#')
  silent execute a:cmd . ' ' . a:dir . ' "' . l:pattern . '" ' . a:scope
  redraw!
  set hlsearch
  call QFCounter()
endfunction


" Show syntax highlighting groups
function! s:SynStack()
  if !exists('*synstack')
      return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction


function! s:ToggleTerminal()
  if bufexists('terminal')
      call win_gotoid(s:winZsh)
      norm! i
  else
      execute ':below 10sp term://$SHELL'
      keepalt file terminal
      let s:winZsh = win_getid()
      norm! i
  endif
endfunction


" Rename file
function! s:RenameFile()
  let l:old_name = expand('%')
  let l:new_name = input('New file name: ', expand('%'), 'file')
  if l:new_name !=# '' && l:new_name !=# l:old_name
    exec ':saveas ' . l:new_name
    exec ':silent !rm ' . l:old_name
    redraw!
  endif
endfunction
  
" Don't close window when deleting a buffer
function! s:CustomCloseBuffer()
  let l:currentBufNum = bufnr('%')
  let l:alternateBufNum = bufnr('#')

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr('%') == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    exec ':bdelete! ' . l:currentBufNum
  endif
endfunction
  
" Close the last buffer if it's the last window
" - For 'quickfix' and 'nofile'
autocmd BufEnter * call <SID>CloseLastBuffer()
function! s:CloseLastBuffer()
  if &buftype ==# 'quickfix' || &buftype ==# 'nofile'
    if winnr('$') < 2
      quit!
    endif
  endif
endfunction
  
" Display the arglist vertically
function! s:DisplayArglist() abort
  let l:argnum = 0
  let l:lenargc = len(argc())
  for l:arg in argv()
    let l:argnum += 1
    let l:filename = fnamemodify(l:arg, ':t')
    let l:changed =
          \ getbufinfo(bufname('^' . l:arg . '$'))[0].changed == 1
          \ ? '+'
          \ : ' '
    let l:current = expand('%') ==# l:arg ? '%' : ' '
    echo printf( '%-*d %s%s %s',
          \ l:lenargc, l:argnum, l:current, l:changed, l:filename)
  endfor
endfunction
  
" Toggle maximize window and resize windows
function! s:ToggleResize() abort
  if winnr('$') > 1
    if exists('t:zoomed') && t:zoomed
      execute t:zoom_winrestcmd
      let t:zoomed = 0
      echo 'Windows resized.'
    else
      let t:zoom_winrestcmd = winrestcmd()
      resize
      vertical resize
      let t:zoomed = 1
      echo 'Window maximized.'
    endif
  endif
endfunction
autocmd VimEnter * autocmd WinEnter * let t:zoomed = 0

" Search into a Visual selection
function! s:RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
      \ '\%>'.(line("'<")-1).'l'.
      \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction

" Highlight the selected text (visual mode)
" Source: https://github.com/nelstrom/vim-visual-star-search
" (You can install it as a plugin)
function! s:VSetSearch()
  let l:temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = l:temp
endfunction
  
" Count grep matches
function! QFCounter() abort
  let l:results = len(getqflist())
  if l:results > 0
    copen
  else
    cclose
  endif
  echo 'Found ' . l:results . ' matches.'
endfunction
  
" Toggle case
function! ToggleCase(str)
  if a:str ==# toupper(a:str)
    let l:result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let l:result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let l:result = toupper(a:str)
  endif
  return l:result
endfunction


" Toggle spell dictionary
function! <SID>ToggleSpelllang()
  if (&spelllang =~# '^en')
    set spelllang=ca
    echo 'Català'
  elseif (&spelllang =~# '^ca')
    set spelllang=es
    echo 'Castellano'
  elseif (&spelllang =~# '^es')
    set spelllang=en_us,en_gb
    echo 'English'
  endif
  set spelllang?
endfunction



" Toggle colorcolumn
function! s:ToggleColorColumn()
  if !exists('s:color_column_old') || s:color_column_old == 0
    let s:color_column_old = &colorcolumn
    Windo let &colorcolumn = 0
  else
    Windo let &colorcolumn = s:color_column_old
    let s:color_column_old = 0
  endif
endfunction


" Toggle the cursor position start/end
function! s:ToggleCPosition(mode)
  execute a:mode
  if !exists('s:togglecp')
    let s:togglecp = 0
  endif
  if col('.') >= col('$') - 1
    let s:togglecp = 1
    norm! ^
  else
    let s:togglecp = 0
    norm! $
  endif
endfunction


" Toggle Gstatus window
function! s:ToggleGstatus() abort
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      execute l:winnr.'close'
    else
      Git
    endif
  endfor
endfunction


" Get Tagbar buffer name
function! s:TagbarBufName() abort
  if !exists('t:tagbar_buf_name')
    let s:buffer_seqno += 1
    let t:tagbar_buf_name = '__Tagbar__.' . s:buffer_seqno
  endif
  return t:tagbar_buf_name
endfunction

" Better toggle for Tagbar
function! s:ToggleTagbar() abort
  let tagbarwinnr = bufwinnr(s:TagbarBufName())
  if tagbarwinnr != -1
    if &modifiable
      execute tagbarwinnr 'wincmd w'
    else
      execute ':TagbarClose'
    endif
  else
    execute ':TagbarOpen'
  endif
endfunction


" Delete trailing white spaces
func! s:DeleteTrailing()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
  echo 'Trailing white spaces have been removed.'
  noh
endfunc


" Keyword density checker
function! s:KeywordDensity() abort
  silent update

  " Words count
  " > Strip the front matter, comments, HTML tags and count the words
  let s:sf = " | sed '1 { /^---/ { :a N; /\\n---/! ba; d }  }'"
  let s:sc = " | sed 's/{% comment.*endcomment %}//g'"
  let s:sh = " | sed 's/<[^>]*.//g'"
  let s:wc = " | wc -w"
  let s:get_words = system("cat " . expand('%') . s:sf. s:sc . s:sh . s:wc)
  let s:int_words = str2nr(s:get_words)
  let s:str_words = string(s:int_words)

  " Highlight count
  let s:match_count = ""
  redir => s:match_count
  silent exec '%s/' . @/ . '//gne'
  redir END

  if ! empty(s:match_count)
    let s:str_keys = split(s:match_count)[0]
    let s:flt_keys = str2float(s:str_keys)

    " Density
    let s:flt_dens = (s:flt_keys/s:int_words)*100
    let s:str_dens = string(s:flt_dens)

    echo '> ' . s:str_keys . ' of ' . s:str_words . ' (' . s:str_dens . '%)'
  else
    echo '> 0 of ' . s:str_words . ' (0%, pattern not found)'
  endif
endfunction


" Commander
function! s:Commander(cmd) abort
	call <SID>WinPreview()
	exec '0read !' . a:cmd
	call <SID>ResizeWinPreview()
endfunction

" Window previewer
function! s:WinPreview() abort
  silent! wincmd P
  if !&previewwindow
    exec 'new'
    setlocal previewwindow
    setlocal buftype=nowrite bufhidden=wipe
    setlocal nobuflisted noswapfile nowrap
    nnoremap <silent> <buffer> q :pclose<CR>
  endif
  exec '%delete'
endfunction

" Resize the preview window
function! s:ResizeWinPreview() abort
  exec '$d'
  let s:size = line('$')
  if s:size < 11
    exec 'resize ' . line('$')
  else
    exec 'resize 10'
  endif
  norm! gg
  wincmd p
endfunction

" Preview outputs (EPUB, PDF, HTML, PNG) with mupdf
function! s:Previewer(out) abort
  let l:dev = ' 2>/dev/null'
  let l:checkps = system('ps -ef
        \ | grep -v grep
        \ | grep mupdf
        \ | grep -o ' . a:out . l:dev)
  if l:checkps ==# ''
    call system('mupdf ' . a:out . ' &')
  else
    call system('pkill -HUP mupdf')
  endif
endfunction

" Convert from EPS to PNG
function! s:EPS2PNG(eps, out) abort
  let l:opt_bef = ' -density 150 '
  let l:opt_aft = ' -flatten -alpha off -colorspace hsl '
  call system('convert' . l:opt_bef . a:eps . l:opt_aft . a:out)
endfunction

" Generator function
  function! s:Generator(ext, ft) abort
    update
    let l:inp = expand('%')
    let l:out = expand('%:r') . a:ext
    if a:ft ==# 'tex'
      let l:cmd = system('pdflatex ' . l:inp)
    elseif a:ft ==# 'markdown'
      if a:ext ==# '.html'
        let l:opt = '--mathjax '
      elseif a:ext ==# '.epub'
        let l:opt = '-t epub2 --webtex '
      elseif a:ext ==# '.pdf'
        let l:opt = '-V fontsize=12pt
              \ -V papersize=a4
              \ -V geometry:margin=2.5cm '
      endif
      let l:cmd = system('pandoc -s ' . l:opt . l:inp . ' -o ' . l:out)
    elseif a:ft ==# 'plantuml'
      let l:cmd = system('plantuml ' . l:inp . ' ' . l:out)
    elseif a:ft ==# 'dot'
      let l:cmd = system('dot -Tpng ' . l:inp . ' -o ' . l:out)
    elseif a:ft ==# 'eukleides'
      let l:eps = expand('%:r') . '.eps'
      let l:cmd = system('eukleides ' . l:inp)
    elseif a:ft ==# 'asy'
      let l:eps = expand('%:r') . '.eps'
      let l:cmd = system('asy ' . l:inp)
    elseif a:ft ==# 'pp3'
      let l:eps = expand('%:r') . '.eps'
      let l:cmd = system('pp3 ' . l:inp)
    elseif a:ft ==# 'gnuplot'
      let l:opt = ' -e "set terminal png; set output ''' . l:out . '''" '
      let l:cmd = system('gnuplot' . l:opt . l:inp)
    elseif a:ft ==# 'pov'
      let l:cmd = system('povray -D ' . l:inp)
    endif
    if v:shell_error ==# 0
      pclose
      if a:ft =~# '\(eukleides\|asy\|pp3\)'
        call <SID>EPS2PNG(l:eps, l:out)
      endif
      call <SID>Previewer(l:out)
    else
      call <SID>WinPreview()
      exec '0put =l:cmd'
      call <SID>ResizeWinPreview()
    endif
  endfunction

  " Run code in the preview window
function! s:Scripty() abort
  update
  let s:runner = <SID>Runners()
  let s:cmd = s:runner . " " . expand("%:p")
  call <SID>Commander(s:cmd)
endfunction