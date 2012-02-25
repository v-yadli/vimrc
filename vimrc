set cindent
set shiftwidth=4
set tabstop=4
syntax on
set autoindent
set encoding=utf-8
set nocompatible
" Menu options
set wildmenu
set wildmode=longest:full
set mouse=a
set number
set hlsearch
set incsearch

" Terminal color workaround
set t_Co=256
" Backspace workaround
set backspace=indent,eol,start
" I don't like wrap
set nowrap

" Son of obsidian!
colorscheme sonofobsidian
set cursorline
set laststatus=2

" Quick movement between windows
" {{{
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

imap <C-j> <Esc><C-w>ji
imap <C-k> <Esc><C-w>ki
imap <C-h> <Esc><C-w>hi
imap <C-l> <Esc><C-w>li
" }}}

" Fire up file type detection!
filetype on
" Folding workaround
set foldmethod=marker
