" Toggle jekyll server in the background
function! s:ToggleJekyll() abort
    call system('lsof -i :4000 | grep -i listen')
    if v:shell_error
      silent exec "!(bundle exec jekyll serve &) > /dev/null"
      call system("touch /tmp/jekyll.ps")
      call system("notify-send -t 2 'Executing Jekyll server...'")
    else
      silent exec "!(pkill -f jekyll &) > /dev/null"
      call system("rm -f /tmp/jekyll.ps")
      call system("notify-send -t 2 'Jekyll server was stoped!'")
    endif
    redraw!
  endfunction