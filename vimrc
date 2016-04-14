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

" Basic
Plugin 'flazz/vim-colorschemes'
" Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/vim-easy-align'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Shougo/vimproc.vim'             " Required by vimshell
Plugin 'Shougo/vimshell.vim'

" Programming languages
Plugin 'scrooloose/syntastic'
Plugin 'fsharp/vim-fsharp'
Plugin 'derekwyatt/vim-scala'
Plugin 'v-yadli/vim-tsl'
Plugin 'pangloss/vim-javascript'
Plugin 'kovisoft/slimv'

" Writing tools
" {{{
Plugin 'reedes/vim-lexical'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'reedes/vim-colors-pencil'
Plugin 'reedes/vim-wordy'
Plugin 'v-yadli/vim-online-thesaurus'
Plugin 'vim-scripts/LaTeX-Box'
"Plugin 'neilagabriel/vim-geeknote'
Plugin 'godlygeek/tabular'              " Required by vim-markdown
Plugin 'plasticboy/vim-markdown'
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
autocmd VimEnter * nnoremap <Esc> :nohlsearch<CR>

"Set fonts according to OS {{{
if has("unix")
    set guifontwide=Sauce\ Code\ Powerline\ Light:h14
    set guifont=Sauce\ Code\ Powerline\ Light:h14
elseif has("win32")
    set guifontwide=Consolas:h11
    set guifont=Consolas:h11
endif
"}}}

" Use a working colorscheme under win32 console
if has("win32") && !has("gui_win32")
    colorscheme pencil
endif

" Terminal color workaround
set t_Co=256
" Backspace workaround
set backspace=indent,eol,start
"{{{ Latex & markdown Settings
" Let TeX file always be recognized
" http://weichen.wordpress.com/2007/01/09/howto-make-vim-latex-suite-always-recognise-tex-file/

let g:tex_flavor = "latex"
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -src-specials $*'
let g:online_thesaurus_map_keys = 0
" For LaTeX files, activate "long line break" feature
" Note that a(english) word won't be broken into two lines
" And, add a color margin line for LaTeX mode!
"

function! WriterMode()
    nnoremap <buffer> <C-F5> :silent! !make.bat<CR>
    nnoremap <buffer> <S-K> :OnlineThesaurusCurrentWord<CR>
    colorscheme pencil
    let g:airline_theme='pencil'
    setlocal background=light
    nnoremap <buffer> <C-e><C-d> mZvapgq'Z
    setlocal smartindent
endfunction

autocmd FileType tex call WriterMode()
autocmd FileType mkd call WriterMode()

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

set noswapfile

" Weird... <C-S> will freeze the terminal. Use <C-Q> to unfreeze it.
" Use tab to indent
vmap <tab> >gv
vmap <s-tab> <gv

" auto complete drop list.
set completeopt=menu,longest,preview

" Quicker navigation in tabs
nmap <C-tab> :tabnext<CR>
nmap <C-S-tab> :tabprevious<CR>

" Enable airline fonts
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='pencil'
set ttimeoutlen=50

autocmd FileType vim nmap <buffer> <S-K> :call VimrcGetHelp()<CR>
autocmd FileType help nmap <buffer> q :q<CR>

if has("win32")
    nmap <M-{> :tabprevious<CR>
    nmap <M-}> :tabnext<CR>
endif

if has("win32")
    let g:GeeknoteScratchDirectory="D:\\temp"
endif

" Shell settings
nnoremap <F11> :call OpenConsole()<CR>
inoremap <F11> <Esc>:call OpenConsole()<CR>

" Lisp settings
let g:slimv_lisp = 'racket'
let g:slimv_impl = 'racket'
let g:slimv_swank_cmd = '!start racket "D:\home\desktop\swank-racket-master\server.rkt" '

"Vsim Functions
"{{{
function! VsimSetDirectoryToCurrentFile()
    lcd %:p:h
endfunction

function! VsimFindReferences()
    call VsimSetDirectoryToCurrentFile()
    let currentWord = expand("<cword>", 1)
    execute "Ag ".currentWord." ."
endfunction

function! OpenConsole()
    execute "VimShellPop"
endfunction

function! VimrcGetHelp()
    let currentWord = expand("<cword>")
    execute "help ".currentWord
endfunction

let g:vsim_wrap_state = 1
function! VsimToggleWrap()
    if g:vsim_wrap_state
        " When I don't like wrap
        let g:vsim_wrap_state = 0
        setlocal colorcolumn=72
        setlocal formatoptions+=tcroqlmM
        setlocal nowrap
        setlocal textwidth=70
        silent! echo "Wrap off"
    else
        let g:vsim_wrap_state = 1
        setlocal formatoptions-=tc
        setlocal wrap
        setlocal colorcolumn=0
        silent! echo "Wrap on"
        nmap j gj
        nmap k gk
        nmap 0 g0
        nmap $ g$
    endif
endfunction

function! VsimEditMarkdown()
    e! \\10.190.174.55\share\trinity-web\blog\test.md
endfunction

function! VsimEncodeMarkdown()
    new!
    r \\10.190.174.55\share\trinity-web\_site\blog\test.html
    set ft=html
    normal V35ggxGV5kxggdd0
    silent! execute "s/language-//g"
    normal "ad3f>
    normal G"bddgg
    silent! execute "%g/^ */s/ /\\&nbsp;/g"
    silent! execute "%s/\\n/<br\\/>/g"
    normal "aP$"bpggy2y
    silent! execute "bd!"
endfunction

"}}}

"Visual Studio key bindings
"{{{

" <C-backspace> binding
imap <C-backspace> <C-o>vbx

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

nmap <C-k><C-r> :call VsimFindReferences()<CR>

vmap <C-k><C-a> :EasyAlign =<CR>

" <C-e> (view) family
call VsimToggleWrap()
nnoremap <C-e><C-w> :call VsimToggleWrap()<CR>

" Necessary Evil
set clipboard=unnamed
vmap <C-C> y
vmap <C-V> gp
imap <C-V> <S-insert>

"}}}
