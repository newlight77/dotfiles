"----------------------------------------------------------------
" 5. Scheme and colors
"----------------------------------------------------------------
" True color
" if !has("nvim")
"   if has("termguicolors")
"       let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"       let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"       set termguicolors
"   endif
" else
"   set termguicolors
" endif

" Syntax highlighting
syntax enable

" Color scheme
" colorscheme atomic

" COLOR SCHEME ------------------------------------------------------------

set background=dark
"set background=light

"colorscheme dracula

"=====colorscheme tokyonight=======
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:lightline = {'colorscheme' : 'tokyonight'}
let g:airline_theme = 'tokyonight'
colorscheme tokyonight
"=====colorscheme tokyonight=======

"=====colorscheme papercolor======
"let g:airline_theme='papercolor'
"let g:lightline = { 'colorscheme': 'PaperColor' }
"let g:PaperColor_Theme_Options = {'theme': {'default': {'transparent_background': 1}}}
"let g:PaperColor_Theme_Options = {'theme': {'default.dark': {'transparent_background': 1}}}
"colorscheme papercolor
"=====colorscheme papercolor=======

" ======rainbow===================
let g:rainbow_active = 1
let g:rainbow_operators = 1
let g:rainbow_conf = {
\   'guifgs' : ['#6A5ACD', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],
\   'ctermfgs' : 'xterm-256color' == $TERM ? ['141', '196', '112', '208', '129', '166', '85', '237'] : ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta'],
\   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
\   'separately': {
\     'css': {
\       'parentheses': [['(',')'], ['\[','\]']],
\     },
\     'scss': {
\       'parentheses': [['(',')'], ['\[','\]']],
\     },
\     'html': {
\       'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
\     },
\   }
\}
" ======rainbow===================