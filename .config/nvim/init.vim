" Specify directory for plugins
call plug#begin(stdpath('data') . '/plugged')


" Set leader key to ,
let mapleader = ','
" Some fancy dancy key remapping
" Get rid of the ctrl-w
noremap <Leader>k <C-w><Up>
noremap <Leader>j <C-w><Down>
noremap <Leader>h <C-w><Right>
noremap <Leader>l <C-w><Left>

noremap <Leader>yy "+yy
noremap <Leader>y "+y
noremap <Leader>Y "+yg_

noremap <Leader>p "+p
noremap <Leader>P "+P

" Set tab to use space and tab to be 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Turn line numbers on
set nu

" This will auto jump you to the last cursor position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Save change tree after write
set undofile
