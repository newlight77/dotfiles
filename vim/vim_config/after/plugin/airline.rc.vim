" Airline settings
let g:airline_theme                       = 'atomic'
let g:airline_powerline_fonts             = 1
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z                   = airline#section#create([
      \ '%1p%% ',
      \ 'Ξ%l%',
      \ '\⍿%c'])

call airline#parts#define_accent('mode', 'black')
