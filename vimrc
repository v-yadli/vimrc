set cindent
set shiftwidth=4
set tabstop=4
set expandtab       " replace tab to whitespace.
syntax on
set autoindent
set smartindent
set encoding=utf-8
set nocompatible
set ignorecase
set smartcase

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
filetype plugin on
filetype indent on
" Folding workaround
set foldmethod=marker
" Quick resource vim configuration
nmap <Leader>ss :source ~/.vimrc<CR>

" Tab operations and buffer operations{{{
nmap <Leader>tt :tab new<CR>
nmap <Leader>bf :buffers<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>ba :ba<CR>
nmap <Leader>bb :bn<CR>
nmap <Leader>bd <C-w><C-v><C-l>:bn<CR><C-h>:bd<CR>
"}}}

" Vimwiki settings{{{
let g:vimwiki_CJK_length=1
"}}}

" Bring back NERD-Tree
nmap <F3> :NERDTreeToggle<CR>
imap <F3> <Esc>:NERDTreeToggle<CR>

" Quick edit vimrc!
command! -nargs=0 Vimrc :silent! tabnew ~/.vim/vimrc

" Weird... <C-S> will freeze the terminal. Use <C-Q> to unfreeze it.
" WTF statusline...
set statusline=%t\ %1*%m%*\ %1*%r%*\ %2*%h%*%w%=%l%3*/%L(%p%%)%*,%c%V]\ [%b:0x%B]\ [%{&ft==''?'TEXT':toupper(&ft)},%{toupper(&ff)},%{toupper(&fenc!=''?&fenc:&enc)}%{&bomb?',BOM':''}%{&eol?'':',NOEOL'}]
" Use tab to indent
vmap <tab> >gv
vmap <s-tab> <gv

autocmd FileType javascript nmap <Leader>rr :!node %<CR>
autocmd FileType python nmap <Leader>rr :!python %<CR>

" auto complete drop list.
set completeopt=longest,menu
