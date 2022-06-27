
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

