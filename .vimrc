set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

filetype plugin indent on     " required!

set shiftwidth=4
set tabstop=4
set number
syntax on

Bundle 'chriskempson/base16-vim'
set background=dark
colorscheme base16-monokai
