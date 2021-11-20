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

" Nerd commenter, comment lines/blocks with ease
Plug 'scrooloose/nerdcommenter'

" Vim Ariline, status bar
Plug 'vim-airline/vim-airline'

" Next, my currated list
" Vim surround, because life is worth living
Plug 'tpope/vim-surround'

" Fugitive for tasty git help
Plug 'tpope/vim-fugitive'

" Add toml coloring
Plug 'cespare/vim-toml'

" vim sensible fom some basic config
Plug 'tpope/vim-sensible'

" Initialize plugin system
call plug#end()
" Remeber, you can reload a file with source %
" Install these plugins with :PlugInstall

set nu " Show line numbers
set rnu " Show relative numbers

filetype plugin on
" Basic tab settings
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab
set expandtab

" Reload file from last change
source $VIMRUNTIME/vimrc_example.vim

" Configure Nerd Commenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

" Set leader to ,
let mapleader = ","

