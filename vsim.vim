" Vism -- Vim with Visual Studio key bindings.
" 
" Yatao Li<yatao.li@live.com>

" Platform-specific variables
if has("win32")
    " python2 for OmniSharp
    if filereadable('C:/Python27Amd64/python.exe')
        let g:python_host_prog  = 'C:/Python27Amd64/python.exe'
    elseif filereadable('C:/Python27/python.exe')
        let g:python_host_prog  = 'C:/Python27/python.exe'
    endif
    if filereadable('C:/ProgramData/Anaconda3/python.exe')
        let g:python3_host_prog='C:/ProgramData/Anaconda3/python.exe'
    elseif filereadable('C:/tools/Anaconda3/python.exe')
        let g:python3_host_prog='C:/tools/Anaconda3/python.exe'
    elseif filereadable('C:\Program Files (x86)\Microsoft Visual Studio\Shared\Anaconda3_64\python.exe')
        let g:python3_host_prog='C:\Program Files (x86)\Microsoft Visual Studio\Shared\Anaconda3_64\python.exe'
    endif
else
    if filereadable(expand('~/anaconda3/bin/python3'))
        let g:python3_host_prog = '~/anaconda3/bin/python3'
    endif
endif

let g:vsim_init = 0

" Initialize plugin system
call plug#begin(g:plugged_dir)

" Solidworks -- Passive plugins/burned into the brain, fire and forget
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/LargeFile'
Plug 'guns/vim-sexp'
Plug 'bohlender/vim-smt2'
Plug 'v-yadli/vim-tsl'

" Utilities -- Things that I do love to issue Ex commands to utilize
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/denite.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Laborotary -- Things I'd love to know more about
if g:vsim_environment=="neovim"
    Plug 'kassio/neoterm'
endif
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'              " Required by vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'gyim/vim-boxdraw'
Plug 'tweekmonster/startuptime.vim'
" hopefully this time it gets things right
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'yatli/coc-powershell',            {'do': { -> coc#powershell#install()}}
Plug 'neoclide/coc-denite'
Plug 'neoclide/coc.nvim',               {'do': { -> coc#util#install({'tag':1})}} 
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree',             { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs',         { 'on': 'NERDTreeToggle' }
Plug 'yatli/vmux.vim'
Plug 'mhinz/vim-signify'

" Junkyard -- things that do not work for me, or never found useful.
" Plug 'reedes/vim-pencil'          <--- not working anymore
" Plug 'rakr/vim-one'               <--- very slow on start!!
" Plug 'itchyny/lightline.vim'      <--- no tabline....
" Plug 'cazador481/fakeclip.neovim' <--- not working
" Plug 'kien/ctrlp.vim'             <--- replaced by fzf
" Plug 'benmills/vimux'             <--- never used
" Plug 'ludwig/split-manpage.vim'   <--- don't even remember how it gets here...
" Plug 'brooth/far.vim'             <--- replaced by language protocol servers
" Plug 'kana/vim-smartinput'        <--- too noisy, bad quotes
" Plug 'vim-scripts/LaTeX-Box'      <--- replaced by vimtex
" Plug 'v-yadli/vim-online-thesaurus'
" Plug 'flazz/vim-colorschemes'     <--- need to customize some of the colors
" Plug 'roxma/nvim-completion-manager' < trying alternatives..
" Plug 'rking/ag.vim'               <---- fzf has this(!)
" Plug 'KabbAmine/zeavim.vim'       <---- never calls Zeal actually...
" Plug 'qpkorr/vim-bufkill'         <---- replaced by vmux.vim
"
" -------------- BEGIN legacy programming environment.. ----------------
"  They never pulled it together well.. Really.
" Plug 'fsharp/vim-fsharp'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'autozimu/LanguageClient-neovim'
" Plug 'Shougo/deoplete.nvim' 
" -------------- END legacy programming environment.. ----------------

" Writing tools
" {{{
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-wordy'
Plug 'panozzaj/vim-autocorrect'
" }}}

" Initialize plugin system finish
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
set wildmode=list:longest,full
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
if g:vsim_environment == "neovim"
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
set completeopt=longest,menuone,preview
set previewheight=5

" Terminal color workaround
if has("termguicolors")
    set termguicolors
endif
" Backspace workaround
set backspace=indent,eol,start
"{{{ Latex & markdown Settings

if g:vsim_environment == 'neovim'
    let g:vsim_latexmk_backend = 'nvim'
else
    let g:vsim_latexmk_backend = 'jobs'
endif

let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : g:vsim_latexmk_backend,
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

function! WriterMode()
    nnoremap <buffer> <F5> :silent! NextWordy<CR>
    let g:lexical#thesaurus = ['~/thesaurus/words.txt', '~/thesaurus/mthesaur.txt','~/thesaurus/roget13a.txt' ]
    let g:lexical#spell = 1
    call lexical#init()
    setlocal smartindent
endfunction

let g:tex_flavor = "latex"
autocmd FileType tex,mkd,markdown call WriterMode()

"}}}

set background=light
colorscheme Tomorrow-Night-Blue
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait100-blinkoff500-blinkon500-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

set cursorline
set laststatus=2

" Fire up file type detection!
filetype on
filetype plugin on
filetype indent on

nmap <C-s> :update<CR>
imap <C-s> <Esc>:update<CR>a

" Folding workaround
set foldmethod=marker
" Quick resource vim configuration
execute "nmap <Leader>ss :source" . g:vsim_config_file . "<CR>"

" Tab operations and buffer operations{{{
nmap <A-t> :enew<CR>
nmap <A-a> ggVG
"}}}

" Quick edit vimrc!
execute "command! -nargs=0 Vimrc  :e " . g:vsim_config_file 

set noswapfile

" Weird... <C-S> will freeze the terminal. Use <C-Q> to unfreeze it.
" Use tab to indent
vmap <tab> >gv
vmap <s-tab> <gv

" auto complete drop list.
set completeopt=longest,menuone,preview

" Coc settings
" -- use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" -- use <Tab> and <S-Tab> for navigate completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" -- use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" -- close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" use error & warning count of diagnostics form coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" create a part for server status.
function! GetServerStatus()
  return get(g:, 'coc_status', '')
endfunction
call airline#parts#define_function('coc', 'GetServerStatus')
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['coc'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" exclude overwrite statusline of list filetype
let g:airline_exclude_filetypes = ["list"]

function! VsimProgrammerMode()
    set updatetime=300
    set signcolumn=yes
    autocmd! CursorHold  * silent call CocActionAsync('highlight')
    autocmd! CursorHoldI * silent call CocActionAsync('showSignatureHelp')
    autocmd! User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    setl formatexpr=CocAction('formmatSelection')
    vmap <buffer> <C-e><C-d> <Plug>(coc-format-selected)
    imap <buffer> <C-e><C-d> <Plug>(coc-format-selected)
    nmap <buffer> <C-e><C-d> :call CocAction('format')<CR>

    nmap <buffer> <C-.>      <Plug>(coc-codeaction)
    vmap <buffer> <C-.>      <Plug>(coc-codeaction-selected)
    nmap <buffer> <F3>       <Plug>(coc-codeaction)
    vmap <buffer> <F3>       <Plug>(coc-codeaction-selected)

    nmap <silent> <buffer> <S-K>      :call CocActionAsync('doHover')<CR>
    nmap <silent> <buffer> <F1>       :call CocActionAsync('doHover')<CR>

    nmap <buffer> <F2>                <Plug>(coc-rename)
    nmap <silent> <buffer> <F12>      <Plug>(coc-definition)
    nmap <silent> <buffer> <C-]>      <Plug>(coc-definition)
    nmap <silent> <buffer> <C-k><C-r> <Plug>(coc-references)

    nmap <silent> <buffer> gd         <Plug>(coc-definition)
    nmap <silent> <buffer> gy         <Plug>(coc-type-definition)
    nmap <silent> <buffer> gi         <Plug>(coc-implementation)
    nmap <silent> <buffer> gr         <Plug>(coc-references)
endfunction

let g:coc_global_extensions=[
            \ 'coc-vimtex',
            \ 'coc-json',
            \ 'coc-tsserver',
            \ 'coc-python',
            \ 'coc-svg',
            \ 'coc-html',
            \ 'coc-highlight',
            \ ]

" Quicker navigation in tabs^H^H^H^Hbuffers...
nmap <C-tab> :bn<CR>
nmap <C-S-tab> :bp<CR>

" airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
let g:airline_exclude_preview = 1
set ttimeoutlen=50

autocmd FileType vim nnoremap <buffer> <S-K> :call VimrcGetHelp()<CR>
autocmd FileType help nnoremap <buffer> q :q<CR>
autocmd FileType qf nnoremap <buffer> q :q<CR>
autocmd FileType c,cpp,typescript,json,ps1,psm1,psd1,fsharp call VsimProgrammerMode()

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

function! VsimEcho(msg)
    if g:vsim_environment == "neovim" && g:vsim_init
        echo a:msg
    else
        silent! echo a:msg
    endif
endfunction

let s:vsim_wrap_state = 0
function! VsimToggleWrap()
    if s:vsim_wrap_state == 0
        let s:vsim_wrap_state = 1
        setlocal formatoptions=roqlmM
        setlocal wrap
        setlocal colorcolumn=0
        setlocal textwidth=80
        call VsimEcho("Wrap=SOFT")
        nmap silent j gj
        nmap silent k gk
        nmap silent 0 g0
        nmap silent $ g$
    elseif s:vsim_wrap_state == 1
        let s:vsim_wrap_state = 2
        setlocal formatoptions=jtcroqmMn
        setlocal nowrap
        setlocal colorcolumn=80
        setlocal textwidth=80
        call VsimEcho("Wrap=HARD")
    elseif s:vsim_wrap_state == 2
        let s:vsim_wrap_state = 3
        setlocal formatoptions=ajtcroqmMn
        setlocal nowrap
        setlocal colorcolumn=80
        setlocal textwidth=80
        call VsimEcho("Wrap=AUTO")
    else
        " When I don't like wrap
        let s:vsim_wrap_state = 0
        setlocal colorcolumn=0
        setlocal formatoptions=tcroqlmM
        setlocal nowrap
        setlocal textwidth=0
        call VsimEcho("Wrap=OFF")
    endif
endfunction

"}}}

"Visual Studio key bindings
"{{{

" <C-backspace> binding
imap <C-BS> <C-o>vbx

" nmap <F6> :make<CR>

" <C-W> (window) family
nmap <C-w><C-s> :NERDTreeToggle<CR>
imap <C-w><C-s> <Esc>:NERDTreeToggle<CR>

nmap <C-w><C-e> :copen<CR>
nmap <C-k><C-r> :call VsimFindReferences()<CR>

" <C-=> for calling EasyAlign
nmap <C-=> ^O:EasyAlign<CR>
vmap <C-=> :EasyAlign<CR>

" <C-k> (kontrol) family
vmap <C-k><C-c> <plug>NERDCommenterComment
vmap <C-k><C-u> <plug>NERDCommenterUncomment

nnoremap <C-c> <silent> <C-c>
nnoremap <C-k><C-c> <S-v>:call NERDComment("x", "Comment")<CR>
nnoremap <C-k><C-u> <S-v>:call NERDComment("x", "Uncomment")<CR>

" <C-e> (view) family
" set Wrap=OFF upon start
let s:vsim_wrap_state = 3
call VsimToggleWrap()

nnoremap <C-e><C-w> :call VsimToggleWrap()<CR>
"nnoremap <C-;> :FZF<CR>
"inoremap <C-;> <C-o>:FZF<CR>

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

" REPL and Neoterm
let g:neoterm_open_in_all_tabs = 1
let g:neoterm_autoinsert = 1
let g:neoterm_keep_term_open = 1

if has("win32")
    let g:neoterm_shell = "powershell"
    let g:neoterm_eof   = "\r"
endif

let s:vsim_theme_idx = 0
let s:vsim_theme_name = ['Tomorrow', 'Tomorrow-Night', 'Tomorrow-Night-Blue', 'pencil', 'pencil', 'colorzone']
let s:vsim_theme_bg   = ['light', 'dark', 'dark', 'light', 'dark', 'light']

" highlight TermCursor gui=standout
" highlight TermCursor guibg=auto
" highlight TermCursor guifg=#ef1810

function! VsimToggleColor()
    let s:vsim_theme_idx = s:vsim_theme_idx + 1
    if s:vsim_theme_idx == 6
        let s:vsim_theme_idx = 0
    endif
    let l:theme = s:vsim_theme_name[s:vsim_theme_idx]
    execute "colorscheme "    . l:theme
    execute "set background=" . s:vsim_theme_bg[s:vsim_theme_idx]
    call VsimEcho("Current theme: ". l:theme)
endfunction

function! VsimOnBufAdd()
    if &previewwindow || &buftype == 'nofile' || &buftype == 'quickfix' || &buftype == 'nofile'
        nnoremap <buffer> q :q<CR>
        setlocal nobuflisted
    endif
endfunction

inoremap <F9> <C-O>:call VsimToggleColor()<CR>
vnoremap <F9> <C-O>:call VsimToggleColor()<CR>
nnoremap <F9> :call VsimToggleColor()<CR>

autocmd BufAdd   * call VsimOnBufAdd()

"}}}

let g:vsim_init = 1
