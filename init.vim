" Vism -- Vim with Visual Studio key bindings.
" 
" Yatao Li<yatao.li@live.com>

call plug#begin('~/.config/nvim/plugged')

" Basic
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/csapprox'
Plug 'qualiabyte/vim-colorstepper'
Plug 'roxma/vim-tmux-clipboard'
" Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'brooth/far.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'cazador481/fakeclip.neovim'

" Programming languages
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'fsharp/vim-fsharp'
Plug 'derekwyatt/vim-scala'
Plug 'v-yadli/vim-tsl'
Plug 'pangloss/vim-javascript'
Plug 'kovisoft/slimv'

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" haskell
"" Haskell Bundle
Plug 'eagletmt/neco-ghc'
Plug 'dag/vim2hs'
Plug 'pbrisbin/vim-syntax-shakespeare'

" python
"" Python Bundle
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'davidhalter/jedi-vim'
Plug 'python-mode/python-mode'
" Writing tools
" {{{
Plug 'reedes/vim-lexical'
Plug 'panozzaj/vim-autocorrect'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-wordy'
" Plug 'v-yadli/vim-online-thesaurus'
Plug 'vim-scripts/LaTeX-Box'
"Plug 'neilagabriel/vim-geeknote'
Plug 'godlygeek/tabular'              " Required by vim-markdown
Plug 'plasticboy/vim-markdown'
" }}}

" Initialize plugin system
call plug#end()

filetype plugin indent on

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
" Necessity Evil Reloaded
let g:vim_fakeclip_tmux_plus=1
set clipboard=unnamedplus

" Terminal color workaround
set t_Co=256
set t_ut=
set termguicolors
" Backspace workaround
set backspace=indent,eol,start
"{{{ Latex & markdown Settings
" Let TeX file always be recognized
" http://weichen.wordpress.com/2007/01/09/howto-make-vim-latex-suite-always-recognise-tex-file/

let g:tex_flavor = "latex"
let g:LatexBox_autojump = 0
let g:online_thesaurus_map_keys = 0
" For LaTeX files, activate "long line break" feature
" Note that a(english) word won't be broken into two lines
" And, add a color margin line for LaTeX mode!
"

function! WriterMode()
    nnoremap <buffer> <C-F5> :make<CR>
    nnoremap <buffer> <F5> :silent! NextWordy<CR>
    nnoremap <buffer> <S-K> :OnlineThesaurusCurrentWord<CR>
    let g:lexical#thesaurus = ['~/thesaurus/words.txt', '~/thesaurus/mthesaur.txt','~/thesaurus/roget13a.txt' ]
    let g:lexical#spell = 1
    call lexical#init()
    colorscheme pencil
    let g:airline_theme='pencil'
    setlocal background=light
    nnoremap <buffer> <C-e><C-d> mZvapgq'Z
    setlocal smartindent
endfunction

autocmd FileType tex call WriterMode()
autocmd FileType mkd call WriterMode()

"}}}
"colorscheme default
"let g:molokai_original = 1
"colorscheme molokai
"colorscheme darkZ
"colorscheme colorzone
"colorscheme solarized
"colorscheme Tomorrow-Night-Blue
colorscheme Tomorrow-Night
"colorscheme beauty256
"colorscheme bluez
"colorscheme C64
"colorscheme bubblegum-256-light
set cursorline
set laststatus=2

" Quick movement between windows, and quick window adjustment
" {{{
nmap <C-Up> <C-w>+
nmap <C-Down> <C-w>-
nmap <C-Left> <C-w><
nmap <C-Right> <C-w>>
" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
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
nmap <Leader>ss :source ~/.config/nvim/init.vim<CR>

" Tab operations and buffer operations{{{
nmap <A-t> :enew<CR>
nmap <A-w> :bd<CR>
nmap <A-n> :bn<CR>
nmap <A-p> :bp<CR>
nmap <A-b> :bp<CR>
nmap <A-f> :bn<CR>
nmap <A-d> :bd<CR>
nmap <A-1> :b1<CR>
nmap <A-2> :b2<CR>
nmap <A-3> :b3<CR>
nmap <A-4> :b4<CR>

nmap <A-a> ggVG
"}}}

" Quick edit vimrc!
command! -nargs=0 Vimrc :e ~/.config/nvim/init.vim

set noswapfile

" Weird... <C-S> will freeze the terminal. Use <C-Q> to unfreeze it.
" Use tab to indent
vmap <tab> >gv
vmap <s-tab> <gv

" auto complete drop list.
set completeopt=menu,longest,preview

" Quicker navigation in tabs
nmap <C-tab> :bn<CR>
nmap <C-S-tab> :bp<CR>

" Enable airline fonts
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='pencil'
set ttimeoutlen=50

autocmd FileType vim nmap <buffer> <S-K> :call VimrcGetHelp()<CR>
autocmd FileType help nmap <buffer> q :q<CR>
autocmd FileType python nmap <buffer> <F5> :VimuxRunCommand "python ".shellescape(@%, 1)<CR>

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" Shell settings
nnoremap <F11> :call OpenConsole()<CR>
inoremap <F11> <Esc>:call OpenConsole()<CR>

" Lisp settings
let g:slimv_lisp = 'racket'
let g:slimv_impl = 'racket'
let g:slimv_swank_cmd = '!start racket "D:\home\desktop\swank-racket-master\server.rkt" '

" Tmux navigation settings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr>

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
    execute "terminal"
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

" nmap <F6> :make<CR>

" <C-W> (window) family
nmap <C-w><C-s> :NERDTreeMirrorToggle<CR>
imap <C-w><C-s> <Esc>:NERDTreeMirrorToggle<CR>

nmap <C-w><C-o> :TagbarToggle<CR>
imap <C-w><C-o> <Esc>:TagbarToggle<CR>

nmap <C-w><C-e> :copen<CR>

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
" set clipboard+=unnamedplus
vmap <C-C> y
vmap <C-V> gp
imap <C-V> <S-insert>

"}}}
