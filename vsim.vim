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
Plug 'kshenoy/vim-signature'          " displays marks in the gutter (sign column)
Plug 'mhinz/vim-signify'              " displays changes in the gutter
Plug 'scrooloose/nerdtree',             { 'on': 'NERDTreeToggle' }
Plug 'yatli/vmux.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/startuptime.vim'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'

if exists("g:fvim_loaded")
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
endif

" mighty coc.nvim
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fidian/hexmode'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Utilities -- Things that I do love to issue Ex commands to utilize
Plug 'mbbill/undotree'

" Laborotary -- Things I'd love to know more about
if g:vsim_environment=="neovim"
    Plug 'kassio/neoterm'
endif
Plug 'godlygeek/tabular'              " Required by vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'gyim/vim-boxdraw'

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

let g:polyglot_disabled = ['fsharp', 'latex', 'xml']


filetype plugin indent on

set nowrap
set cindent
set title           " enable titlestring
set shiftwidth=4
set tabstop=4
set expandtab       " replace tab to whitespace.
syntax on
set autoindent
set smartindent
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
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
if has("termguicolors") && !(has("win32") && $TERM != 'vtpcon') || exists("g:fvim_loaded")
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
    setlocal concealcursor="n"
endfunction

let g:tex_flavor = "latex"
autocmd FileType tex,mkd,markdown call WriterMode()

"}}}

set background=dark
let g:falcon_airline = 1
let g:falcon_inactive = 1
let g:falcon_background = 1

"let g:airline_theme = 'falcon'
let g:airline_theme='tomorrow'

colorscheme Tomorrow-Night-Blue
"colorscheme PaperColor
" colorscheme falcon
" colorscheme pencil
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
set foldmethod=manual
set foldlevelstart=10
nmap <Space> za
" Quick resource vim configuration
execute "nmap <Leader>ss :source" . g:vsim_config_file . "<CR>"

" Quick edit vimrc!
execute "command! -nargs=0 Vimrc edit " . g:vsim_config_file 

" quick cd to buffer directory
command! -nargs=0 CD cd %:h

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
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" -- use <cr> to confirm complete
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" -- close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

if exists("g:fvim_loaded")
    " https://github.com/neoclide/coc.nvim/pull/603
    "call coc#config('suggest.completionItemKindLabels', {
                "\   'function': '',
                "\   'method': '',
                "\   'variable': '',
                "\   'constant': '',
                "\   'struct': 'פּ',
                "\   'class': '',
                "\   'interface': '禍',
                "\   'text': '',
                "\   'enum': 'ﳁ2',
                "\   'enumMember': '',
                "\   'module': '',
                "\   'color': ' ',
                "\   'property': '襁',
                "\   'field': '綠',
                "\   'unit': '',
                "\   'file': '',
                "\   'value': '',
                "\   'event': '鬒',
                "\   'folder': '',
                "\   'keyword': '',
                "\   'snippet': '',
                "\   'operator': '洛',
                "\   'reference': '',
                "\   'typeParameter': '<T>',
                "\   'default': ''
                "\ })
    call coc#config('diagnostic', {
                \   'errorSign': '',
                \   'warningSign': '',
                \   'infoSign': '',
                \   'hintSign': 'ﳁ',
                \ })
    call coc#config('codeLens', {'separator': ''})
endif

" airline settings
let g:airline_powerline_fonts=1
let g:airline_inactive_collapse=1
let g:airline_inactive_alt_sep=0
let g:airline_detect_modified=1
let g:airline_exclude_preview=1
let g:airline_highlighting_cache=1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let g:airline#extensions#tabline#fnamemod = ':t'
set ttimeoutlen=50

" create airline parts for coc server status & coc_current_function
function! VsimAirlineCocServer()
  return get(g:, 'coc_status', '')
endfunction
function! VsimAirlineCurrentFunction()
  let n = get(b:, 'coc_current_function', '')
  if n != ''
      return n.' '
  else
      return n
  endif
endfunction
function! VsimAirlineCurrentChar()
  let chr = matchstr(getline('.'), '\%' . col('.') . 'c.')
  return '[' . printf("0x%04X", char2nr(chr)) . ']'
endfunction

call airline#parts#define_function('coc', 'VsimAirlineCocServer')
call airline#parts#define_function('buf_func', 'VsimAirlineCurrentFunction')
call airline#parts#define_function('cur_char', 'VsimAirlineCurrentChar')

function! AirlineInit()
  let spc=g:airline_symbols.space
  let g:airline_section_a = airline#section#create(['crypt', 'paste', 'spell', 'iminsert', 'coc'])
  let g:airline_section_x = airline#section#create(['buf_func', 'filetype'])
  let g:airline_section_y = airline#section#create(['ffenc'])
  let g:airline_section_z = airline#section#create(['cur_char', 'windowswap', 'obsession', '%3p%%'.spc, 'linenr', 'maxlinenr', spc.':%3v'])

  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" exclude overwrite statusline of list filetype
let g:airline_exclude_filetypes = ["list"]

" set folder open/close glyphs
let g:NERDTreeDirArrowExpandable="▸"
let g:NERDTreeDirArrowCollapsible="▾"
let g:NERDTreeHighlightFolders = 1
" do not alter cursorline for NERDTree
let g:NERDTreeHighlightCursorline = 0
" show glyphs for NERDTree
let g:webdevicons_enable_nerdtree = 1
" don't show brackets around NERDTree glyphs
let g:webdevicons_conceal_nerdtree_brackets = 1
" show folder glyphs for NERDTree
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" show folder open/close glyphs
let g:DevIconsEnableFoldersOpenClose = 1
" more filetypes...
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.xaml$'] = 'ﭲ'
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\.svg$'] = 'ﰟ'
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*\..*proj$'] = ''

let g:indentLine_char_list = [ '┆', '┊']
let g:indentLine_leadingSpaceChar = '·'

let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
let g:startify_session_before_save = [
            \ 'echo "Cleaning up before saving.."',
            \ 'silent! NERDTreeTabsClose'
            \ ]
"if exists('g:fvim_startify')
    "Startify
"endif

""" Register a prefix-based key
function! s:vsim_key(prefix, key, cmd)
    let key = len(a:key) == 1 ? a:key : '<'.a:key.'>'
    execute 'nmap <silent> <buffer> <C-'.a:prefix.'>'.key.' '.a:cmd
    execute 'nmap <silent> <buffer> <C-'.a:prefix.'><C-'.a:key.'> '.a:cmd
endfunction

""" Register a coc key
function! s:coc_key(key,cmd)
    call s:vsim_key('c', a:key, a:cmd)
endfunction

function! VsimProgrammerMode()
    set updatetime=300
    set signcolumn=yes
    autocmd! CursorHold  * silent call CocActionAsync('highlight')
    autocmd! CursorHoldI * silent call CocActionAsync('showSignatureHelp')
    autocmd! User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    setlocal nobackup
    setlocal nowritebackup

    setl formatexpr=CocAction('formatSelection')
    vmap <buffer> <C-e><C-d> <Plug>(coc-format-selected)
    nmap <buffer> <C-e><C-d> :call CocAction('format')<CR>
    vmap <buffer> <C-e>d     <Plug>(coc-format-selected)
    nmap <buffer> <C-e>d     :call CocAction('format')<CR>

    nmap <buffer> <C-.>      <Plug>(coc-codeaction)
    vmap <buffer> <C-.>      <Plug>(coc-codeaction-selected)

    if &filetype != 'vim'
        nmap <silent> <buffer> <S-K>      :call CocActionAsync('doHover')<CR>
    endif

    if &filetype == 'fsharp' || &filetype == 'vim'
        setlocal foldmethod=indent
    endif

    if &filetype == 'ps1'
        nmap <buffer> <F5> :CocCommand powershell.execute<CR>
        nmap <buffer> <F8> :CocCommand powershell.evaluateLine<CR>
        vmap <buffer> <F8> :<C-u>CocCommand powershell.evaluateSelection<CR>
    endif

    if &filetype == 'fsharp'
        nmap <buffer> <F5> :CocCommand fsharp.run<CR>
        nmap <buffer> <F8> :CocCommand fsharp.evaluateLine<CR>
        vmap <buffer> <F8> :<C-u>CocCommand fsharp.evaluateSelection<CR>
    endif

    nmap <silent> <buffer> <F1>       :call CocActionAsync('doHover')<CR>

    nmap <buffer> <F2>                <Plug>(coc-rename)
    nmap <silent> <buffer> <F12>      <Plug>(coc-definition)
    nmap <silent> <buffer> <C-]>      <Plug>(coc-declaration)
    nmap <silent> <buffer> <C-k><C-r> <Plug>(coc-references)
    nmap <silent> <buffer> <C-k>r     <Plug>(coc-references)

    nmap <silent> <buffer> gd         <Plug>(coc-definition)
    nmap <silent> <buffer> gy         <Plug>(coc-type-definition)
    nmap <silent> <buffer> gi         <Plug>(coc-implementation)
    nmap <silent> <buffer> gr         <Plug>(coc-references)

    call s:coc_key('p',   ':CocCommand<CR>')
    call s:coc_key('[',   '<Plug>(coc-diagnostic-prev)')
    call s:coc_key(']',   '<Plug>(coc-diagnostic-next)')
    call s:coc_key('c',   ':CocListResume<CR>')
    call s:coc_key('n',   ':CocNext<CR>')
    call s:coc_key('b',   ':CocList buffers<CR>')
    call s:coc_key('d',   ':CocList diagnostics<CR>')
    call s:coc_key('f',   ':CocList files<CR>')
    call s:coc_key('s',   ':CocList symbols<CR>')
    call s:coc_key('m',   ':CocList marks<CR>')
    call s:coc_key('tab', ':CocList mru<CR>')
endfunction

let g:coc_global_extensions=[
            \ 'coc-vimtex',
            \ 'coc-texlab',
            \ 'coc-json',
            \ 'coc-yaml',
            \ 'coc-tsserver',
            \ 'coc-python',
            \ 'coc-html',
            \ 'coc-highlight',
            \ 'coc-fsharp',
            \ 'coc-vimlsp',
            \ 'coc-powershell',
            \ 'coc-lists',
            \ 'coc-snippets',
            \ 'coc-xml',
            \ 'coc-marketplace',
            \ 'coc-omnisharp',
            \ ]
" \ 'coc-sh',

"set runtimepath^=F:/git/coc-powershell
"set runtimepath^=F:/git/coc-omnisharp

" Quicker navigation in tabs^H^H^H^Hbuffers...
nmap <C-tab> :bn<CR>
nmap <C-S-tab> :bp<CR>

autocmd FileType vim nnoremap <buffer> <S-K> :call VimrcGetHelp()<CR>
autocmd FileType c,cpp,typescript,javascript,json,ps1,psm1,psd1,fsharp,cs,python,vim,xml,sh,cuda call VsimProgrammerMode()

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

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-/> :TmuxNavigatePrevious<cr>

tnoremap <silent> <A-h> <C-\><C-N>:TmuxNavigateLeft<cr>
tnoremap <silent> <A-j> <C-\><C-N>:TmuxNavigateDown<cr>
tnoremap <silent> <A-k> <C-\><C-N>:TmuxNavigateUp<cr>
tnoremap <silent> <A-l> <C-\><C-N>:TmuxNavigateRight<cr>
tnoremap <silent> <A-/> <C-\><C-N>:TmuxNavigatePrevious<cr>

inoremap <silent> <A-h> <C-O>:TmuxNavigateLeft<cr>
inoremap <silent> <A-j> <C-O>:TmuxNavigateDown<cr>
inoremap <silent> <A-k> <C-O>:TmuxNavigateUp<cr>
inoremap <silent> <A-l> <C-O>:TmuxNavigateRight<cr>
inoremap <silent> <A-/> <C-O>:TmuxNavigatePrevious<cr>

nnoremap <silent> <C-A-h> <C-w>H
nnoremap <silent> <C-A-j> <C-w>J
nnoremap <silent> <C-A-k> <C-w>K
nnoremap <silent> <C-A-l> <C-w>L

nnoremap <silent> <A-1> :1b<cr>
nnoremap <silent> <A-2> :2b<cr>
nnoremap <silent> <A-3> :3b<cr>
nnoremap <silent> <A-4> :4b<cr>
nnoremap <silent> <A-5> :5b<cr>
nnoremap <silent> <A-6> :6b<cr>
nnoremap <silent> <A-7> :7b<cr>
nnoremap <silent> <A-8> :8b<cr>
nnoremap <silent> <A-9> :9b<cr>

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
imap <C-BS> <C-o>"_db<C-o>"_x


" nmap <F6> :make<CR>

" <C-W> (window) family
nmap <C-w><C-s> :NERDTreeToggle<CR>
imap <C-w><C-s> <Esc>:NERDTreeToggle<CR>

nmap <C-w><C-e> <silent> :cwindow<CR>
nmap <C-k><C-r> <silent> :call VsimFindReferences()<CR>

" <C-=> for calling EasyAlign
nmap <C-=> <Plug>(EasyAlign)
vmap <C-=> <Plug>(EasyAlign)

let g:easy_align_delimiters = {
    \ '-': { 'pattern': '->\|<-' },
    \ }

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
nnoremap <C-e>w :call VsimToggleWrap()<CR>
nnoremap <C-e><C-l> :IndentLinesToggle<CR>
nnoremap <C-e>l :IndentLinesToggle<CR>
nnoremap <C-e><C-s> :LeadingSpaceToggle<CR>
nnoremap <C-e>s :LeadingSpaceToggle<CR>


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

" REPL and Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_open_in_all_tabs = 1
let g:neoterm_autoinsert = 1
let g:neoterm_keep_term_open = 1
let g:neoterm_default_mod = ':belowright'

if has("win32")
    let g:neoterm_shell = "powershell"
    let g:neoterm_eof   = "\r"
endif

let s:vsim_theme_idx = 0
let s:vsim_theme_name = ['falcon', 'Tomorrow', 'Tomorrow-Night', 'Tomorrow-Night-Blue', 'pencil', 'pencil', 'colorzone', 'PaperColor']
let s:vsim_theme_bg   = ['dark',   'light',    'dark',           'dark',                'light',  'dark',   'light',     'light']

" highlight TermCursor gui=standout
" highlight TermCursor guibg=auto
" highlight TermCursor guifg=#ef1810
" TODO: figure out why these terminal color settings aren't working
"let g:terminal_color_7 = '#b4b4b9'
"let g:terminal_color_8 = '#b4b4b9'

function! VsimToggleColor()
    let s:vsim_theme_idx = s:vsim_theme_idx + 1
    if s:vsim_theme_idx >= len(s:vsim_theme_name)
        let s:vsim_theme_idx = 0
    endif

    let l:theme = s:vsim_theme_name[s:vsim_theme_idx]
    let l:bg    = s:vsim_theme_bg[s:vsim_theme_idx]

    execute "colorscheme "    . l:theme
    execute "set background=" . l:bg

    if exists('g:fvim_loaded')
        FVimFontNormalWeight (l:bg == 'dark') ? 300 : 400
    endif
    
    call VsimEcho("Current theme: ". l:theme)
endfunction

inoremap <F9> <C-O>:call VsimToggleColor()<CR>
vnoremap <F9> <C-O>:call VsimToggleColor()<CR>
nnoremap <F9> :call VsimToggleColor()<CR>

"}}}

let g:vsim_init = 1
