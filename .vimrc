" First, download vimplug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify directory path
call plug#begin('~/.vim/plugged')

" First, a thing or two from their example on their website
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Next, my currated list
" Vim surround, because life is worth living
Plug 'tpope/vim-surround'

" Fugitive for tasty git help
Plug 'tpope/vim-fugitive'

" vim sensible fom some basic config
Plug 'tpope/vim-sensible'

" Initialize plugin system
call plug#end()
" Remeber, you can reload a file with source %
" Install these plugins with :PlugInstall

set nu " Show line numbers
set rnu " Show relative numbers

set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab
set expandtab

source $VIMRUNTIME/vimrc_example.vim

