" Configure a sqlite database
function! s:SqliteDatabase() abort
    let t:path = input('Database: ')
  endfunction

" Execute SQL queries
function! s:SQLExec(opt) abort
  if a:opt ==# 'n'
    silent norm! yy
  elseif a:opt ==# 'v'
    silent norm! gvy
  endif
  if !exists('t:path')
    call <SID>SqliteDatabase()
  endif
  if filereadable(t:path)
    let t:sql = @
    let t:sql = substitute(t:sql, '\n', ' ', 'g')
    let t:format = " | column -t -s '|'"
    if t:sql =~? '^select'
      let t:cmd = t:path . ' "' . escape(t:sql, '"') . '"' . t:format
    else
      let t:cmd = t:path . ' "' . escape(t:sql, '"') . '"'
    endif
    let s:cmd = "sqlite3 -list -batch " . t:cmd
    call <SID>Commander(s:cmd)
  else
    echo "\nThis database does not exist!"
  endif
endfunction


" Commander
function! s:Commander(cmd) abort
	call <SID>WinPreview()
	exec '0read !' . a:cmd
	call <SID>ResizeWinPreview()
endfunction
