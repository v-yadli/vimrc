" Vism -- Vim with Visual Studio key bindings.
" 
" Yatao Li<yatao.li@live.com>

if has("win32")
    call plug#begin('~/AppData/Local/nvim/plugged')
    " http://vim.wikia.com/wiki/Adding_Vim_to_MS-Windows_File_Explorer_Menu
    " see second approach -- no shellext dll needed
else
    call plug#begin('~/.config/nvim/plugged')
endif

" Solidworks -- Passive plugins/burned into the brain, fire and forget
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'flazz/vim-colorschemes'
Plug 'roxma/vim-tmux-clipboard'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdcommenter'

" Utilities -- Things that I do love to issue Ex commands to utilize
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'

" Laborotary -- Things I'd love to know more about
Plug 'kassio/neoterm'
Plug 'tpope/vim-surround'
Plug 'kana/vim-smartinput'

" Junkyard -- things that do not work for me, or never found useful.
" Plug 'cazador481/fakeclip.neovim' <--- not working
" Plug 'kien/ctrlp.vim'             <--- replaced by fzf
" Plug 'benmills/vimux'             <--- never used
" Plug 'ludwig/split-manpage.vim'   <--- don't even remember how it gets here...
" Plug 'brooth/far.vim'             <--- replaced by language protocol servers



" Programming languages and environment
Plug 'sheerun/vim-polyglot'
Plug 'v-yadli/vim-tsl'

if has("win32")
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'powershell install.ps1',
        \ }
else
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
endif

" (Completion plugin option 1)
Plug 'roxma/nvim-completion-manager'

" Writing tools
" {{{
Plug 'reedes/vim-lexical'
Plug 'panozzaj/vim-autocorrect'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-wordy'
" Plug 'v-yadli/vim-online-thesaurus'
Plug 'vim-scripts/LaTeX-Box'
Plug 'godlygeek/tabular'              " Required by vim-markdown
Plug 'plasticboy/vim-markdown'
" }}}

" Initialize plugin system
call plug#end()

filetype plugin indent on

set nowrap
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
" let g:vim_fakeclip_tmux_plus=1
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
    "colorscheme pencil
    "let g:airline_theme='pencil'
    "setlocal background=light
    nnoremap <buffer> <C-e><C-d> mZvapgq'Z
    setlocal smartindent
    let g:vsim_wrap_state = 0
    set wrap
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
if has("win32")
    nmap <Leader>ss :source ~/AppData/Local/nvim/init.vim<CR>
else
    nmap <Leader>ss :source ~/.config/nvim/init.vim<CR>
endif

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
if has("win32")
    command! -nargs=0 Vimrc :e ~/AppData/Local/nvim/init.vim
else
    command! -nargs=0 Vimrc :e ~/.config/nvim/init.vim
endif

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

autocmd FileType vim nnoremap <buffer> <S-K> :call VimrcGetHelp()<CR>
autocmd FileType help nnoremap <buffer> q :q<CR>
autocmd FileType qf nnoremap <buffer> q :q<CR>
autocmd FileType nerdtree nnoremap <buffer> q :NERDTreeToggle<CR>

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

" Tmux navigation settings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

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

function! VimrcGetHelp()
    let currentWord = expand("<cword>")
    execute "help ".currentWord
endfunction

let g:vsim_wrap_state = 0
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
        nmap silent j gj
        nmap silent k gk
        nmap silent 0 g0
        nmap silent $ g$
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

"LanguageServerProtocol setup
"required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'python': ['pyls'],
    \ 'cs': ['~\.omnisharp\OmniSharp.exe'],
    \ 'ps1': ['powershell', '~\git\PowerShellEditorServices\module\Start-EditorServices.ps1', '-HostName', 'nvim', '-HostProfileId', '0', '-HostVersion', '1.0.0', '-EditorServicesVersion', '1.6.0', '-LogPath', 'pses.log.txt', '-LogLevel', 'Normal', '-BundledModulesPath', '~\git\PowerShellEditorServices\module', '-Stdio'],
    \ }


autocmd FileType cs call VsimEnableLanguageServerKeys()
autocmd FileType ps1 call VsimEnableLanguageServerKeys()
autocmd FileType hs call VsimEnableLanguageServerKeys()
autocmd FileType py call VsimEnableLanguageServerKeys()

"Visual Studio key bindings
"{{{

" <C-backspace> binding
imap <C-backspace> <C-o>vbx

" nmap <F6> :make<CR>

" <C-W> (window) family
nmap <C-w><C-s> :NERDTreeMirrorToggle<CR>
imap <C-w><C-s> <Esc>:NERDTreeMirrorToggle<CR>

nmap <C-w><C-e> :copen<CR>
nmap <C-k><C-r> :call VsimFindReferences()<CR>

function! VsimEnableLanguageServerKeys()
    " TODO hover with timer
    nnoremap <silent> <S-K> :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
    nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> <F12> :call LanguageClient_textDocument_definition()<CR>
    set formatexpr=LanguageClient_textDocument_rangeFormatting()
    vnoremap = :call LanguageClient_textDocument_rangeFormatting()<CR>
    nnoremap <C-k><C-r> :call LanguageClient_textDocument_references()<CR>
    nnoremap <C-e><C-d> :call LanguageClient_textDocument_formatting()<CR>
endfunction


" <C-k> (kontrol) family
vmap <C-k><C-c> <plug>NERDCommenterComment
vmap <C-k><C-u> <plug>NERDCommenterUncomment

nnoremap <C-c> <silent> <C-c>
nnoremap <C-k><C-c> <S-v>:call NERDComment("x", "Comment")<CR>
nnoremap <C-k><C-u> <S-v>:call NERDComment("x", "Uncomment")<CR>


vmap <C-=> :EasyAlign =<CR>

" <C-e> (view) family
call VsimToggleWrap()
nnoremap <C-e><C-w> :call VsimToggleWrap()<CR>
nnoremap <C-;> :FZF<CR>
inoremap <C-;> <C-o>:FZF<CR>

vnoremap <C-C> y
vnoremap <C-X> x
vnoremap <C-V> gp
inoremap <C-V> <C-O>p
vnoremap <BS> "_d
vnoremap <Del> "_x

inoremap <S-Left> <C-o>v
inoremap <S-Right> <Right><C-o>v
inoremap <S-Up> <C-o>v<Up>
inoremap <S-Down> <Right><C-o>v<Down>

nnoremap <S-Left> <Left>v
nnoremap <S-Right> v
nnoremap <S-Up> v<Up>
nnoremap <S-Down> v<Down>

vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>
vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>

vnoremap <Left> <Esc><Left>
vnoremap <Right> <Esc><Right>
vnoremap <Up> <Esc><Up>
vnoremap <Down> <Esc><Down>

"}}}
