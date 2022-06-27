" Execute Maxima instructions
function! s:MaximaExec(opt) abort
    if a:opt ==# 'n'
      silent norm! yy
    elseif a:opt ==# 'v'
      silent norm! gvy
    endif
    let b:equ = @
    let b:equ = substitute(b:equ, '\n', ' ', 'g')
    let b:equ = substitute(b:equ, '\s$', '', 'g')
    let b:equ = substitute(b:equ, '%', '\\%', 'g')
    if b:equ !~# ';$'
      let b:equ = substitute(b:equ, '$', ';', 'g')
    endif
    let s:cmd = 'maxima --very-quiet --batch-string "' . b:equ . '"'
    call <SID>Commander(s:cmd)
  endfunction


  " Commander
function! s:Commander(cmd) abort
	call <SID>WinPreview()
	exec '0read !' . a:cmd
	call <SID>ResizeWinPreview()
endfunction
