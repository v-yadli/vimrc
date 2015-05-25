" Vism -- Vim with Visual Studio key bindings.
" 
" Yatao Li<yatao.li@live.com>

"{{{ Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize

if has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
else
    set rtp+=~/_vim/bundle/Vundle.vim
    let bundle_path='~/_vim/bundle'
    call vundle#begin(bundle_path)
endif

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/vim-easy-align'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/Conque-Shell'

" Writing tools
" {{{
Plugin 'reedes/vim-lexical'
Plugin 'vim-autocorrect'
Plugin 'reedes/vim-colors-pencil'
Plugin 'reedes/vim-wordy'
" }}}

" The following are examples of different formats supported.
"{{{ Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"}}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"}}} Put your non-Plugin stuff after this line

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
set wildmode=full
" Auto mouse
set mouse=a
" Line number
set number
" Highlight search & incremental search
set hlsearch
set incsearch
" Disable toolbar
set guioptions-=T
set guioptions-=m
" Disable scroll bar
set guioptions-=L
set guioptions-=r
" Bind ESC in normal mode to clear highlight search
" TODO
autocmd VimEnter * nnoremap <Esc> :nohlsearch<CR>

"Set fonts according to OS {{{
if has("unix")
    set guifontwide=Consolas:h14
    set guifont=Consolas:h14
elseif has("win32")
    set guifontwide=Consolas:h11
    set guifont=Consolas:h11
endif
"}}}

" Terminal color workaround
set t_Co=256
" Backspace workaround
set backspace=indent,eol,start
" I don't like wrap
set formatoptions+=tcroqlmM
set nowrap
set textwidth=70
"{{{ Latex Settings
" Let TeX file always be recognized
" http://weichen.wordpress.com/2007/01/09/howto-make-vim-latex-suite-always-recognise-tex-file/

let g:tex_flavor = "latex"
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'

" For LaTeX files, activate "long line break" feature
" Note that a(english) word won't be broken into two lines
" And, add a color margin line for LaTeX mode!

augroup Latex
    au!
augroup END

autocmd FileType tex set formatoptions-=l
autocmd FileType tex set formatoptions+=m
autocmd FileType tex set colorcolumn=72
autocmd FileType tex nnoremap <C-F5> :!make.bat<CR>
" See: https://github.com/reedes/vim-colors-pencil
autocmd FileType tex colorscheme pencil
autocmd FileType tex let g:airline_theme='pencil'
autocmd FileType tex set background light

"}}}
let g:molokai_original = 1
colorscheme molokai
"colorscheme darkZ
"colorscheme colorzone
"colorscheme solarized
set cursorline
set laststatus=2

" Quick movement between windows, and quick window adjustment
" {{{
nmap <C-Up> <C-w>+
nmap <C-Down> <C-w>-
nmap <C-Left> <C-w><
nmap <C-Right> <C-w>>
" }}}

" Fire up file type detection!
filetype on
filetype plugin on
filetype indent on

nmap <C-s> :update<CR>
imap <C-s> <Esc>:update<CR>a

" Folding workaround
set foldmethod=marker
" Quick resource vim configuration
if has("unix")
    nmap <Leader>ss :source ~/.vimrc<CR>
else
    nmap <Leader>ss :source ~/_vimrc<CR>
endif

" Tab operations and buffer operations{{{
nmap <Leader>tt :tab new<CR>
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprevious<CR>
nmap <Leader>bf :buffers<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>ba :ba<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bd :bd!<CR>
"}}}

" Quick edit vimrc!
if has("win32")
    command! -nargs=0 Vimrc :silent! tabnew ~/_vim/vimrc
else
    command! -nargs=0 Vimrc :silent! tabnew ~/.vim/vimrc
endif

" Weird... <C-S> will freeze the terminal. Use <C-Q> to unfreeze it.
" Use tab to indent
vmap <tab> >gv
vmap <s-tab> <gv

" auto complete drop list.
set completeopt=menu,longest,preview

" Necessary Evil
set clipboard=unnamed
vmap <C-C> y
vmap <C-V> gp
imap <C-V> <S-insert>

" Quicker navigation in tabs
nmap <C-tab> :tabnext<CR>
nmap <C-S-tab> :tabprevious<CR>

" Enable airline fonts
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
set ttimeoutlen=50

autocmd FileType vim nmap <buffer> <S-K> :call VimrcGetHelp()<CR>
autocmd FileType help nmap <buffer> q :q<CR>

function! VimrcGetHelp()
    let currentWord = expand("<cword>")
    execute "help ".currentWord
endfunction

if has("win32")
    nmap <M-{> :tabprevious<CR>
    nmap <M-}> :tabnext<CR>
endif

"Visual Studio key bindings
"{{{

nmap <F6> :make<CR>

" <C-W> (window) family
nmap <C-w><C-s> :NERDTreeMirrorToggle<CR>
imap <C-w><C-s> <Esc>:NERDTreeMirrorToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup     = 0
let g:nerdtree_tabs_open_on_console_startup = 0

nmap <C-w><C-e> :copen<CR>
nmap <C-w><C-c> :call OpenConsole()<CR>

" <C-k> (kontrol) family
vmap <C-k><C-c> <plug>NERDCommenterComment
vmap <C-k><C-u> <plug>NERDCommenterUncomment

nnoremap <C-c> <silent> <C-c>
nnoremap <C-k><C-c> <S-v>:call NERDComment("x", "Comment")<CR>
nnoremap <C-k><C-u> <S-v>:call NERDComment("x", "Uncomment")<CR>

nmap <C-k><C-r> :call FindReferences()<CR>

function! SetDirectoryToCurrentFile()
    lcd %:p:h
endfunction

function! FindReferences()
    call SetDirectoryToCurrentFile()
    let currentWord = expand("<cword>", 1)
    execute "Ag ".currentWord." ."
endfunction

function! OpenConsole()

endfunction

vmap <C-k><C-a> :EasyAlign =<CR>

"}}}
