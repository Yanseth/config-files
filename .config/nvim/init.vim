set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=$runtimepath
source ~/.vimrc

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

