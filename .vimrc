set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

Plugin 'chriskempson/base16-vim'

Plugin 'after/vim-instant-markdown'

Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on     " required!

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set shiftwidth=4
set tabstop=4
set number
syntax on

set background=dark
colorscheme base16-monokai
