" Vism -- Vim with Visual Studio key bindings.
" 
" Yatao Li<yatao.li@live.com>



" Platform-specific variables
if has("win32")
    let g:OmniSharp_server_path = 'C:\Tools\omnisharp\OmniSharp.exe'
    " python2 for OmniSharp
    if filereadable('C:/Python27Amd64/python.exe')
        let g:python_host_prog  = 'C:/Python27Amd64/python.exe'
    elseif filereadable('C:/Python27/python.exe')
        let g:python_host_prog  = 'C:/Python27/python.exe'
    endif
    if filereadable('C:/ProgramData/Anaconda3/python.exe')
        let g:python3_host_prog='C:/ProgramData/Anaconda3/python.exe'
    endif
    let g:plugged_dir           = '~/AppData/Local/nvim/plugged'
    let g:languageClient_install =  'powershell install.ps1'
    let g:nvim_config_file = '~/AppData/Local/nvim/init.vim'
    let g:neoterm_eof = "\r\n"
    " let g:neoterm_shell = "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe" "doesn't work..

    " http://vim.wikia.com/wiki/Adding_Vim_to_MS-Windows_File_Explorer_Menu
    " see second approach -- no shellext dll needed
else
    let g:OmniSharp_server_path = '~/bin/omnisharp/OmniSharp'
    let g:plugged_dir           = '~/.config/nvim/plugged'
    let g:languageClient_install =  'bash install.sh'
    let g:nvim_config_file = '~/.config/nvim/init.vim'
endif

" Initialize plugin system
call plug#begin(g:plugged_dir)

" Solidworks -- Passive plugins/burned into the brain, fire and forget
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'roxma/vim-tmux-clipboard'
Plug 'rakr/vim-one'
Plug 'bling/vim-airline'
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
let g:polyglot_disabled = ['latex', 'fsharp']
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'              " Required by vim-markdown
Plug 'plasticboy/vim-markdown'

" Junkyard -- things that do not work for me, or never found useful.
" Plug 'cazador481/fakeclip.neovim' <--- not working
" Plug 'kien/ctrlp.vim'             <--- replaced by fzf
" Plug 'benmills/vimux'             <--- never used
" Plug 'ludwig/split-manpage.vim'   <--- don't even remember how it gets here...
" Plug 'brooth/far.vim'             <--- replaced by language protocol servers
" Plug 'kana/vim-smartinput'        <--- too noisy, bad quotes
" Plug 'vim-scripts/LaTeX-Box'      <--- replaced by vimtex
" Plug 'v-yadli/vim-online-thesaurus'
" Plug 'flazz/vim-colorschemes'     <--- need to customize some of the colors
" Plug 'vim-airline/vim-airline-themes'
" Plug 'roxma/nvim-completion-manager' < trying alternatives..

" Programming languages and environment
Plug 'sheerun/vim-polyglot'
Plug 'v-yadli/vim-tsl'
Plug 'vim-syntastic/syntastic'
if has("win32")
    Plug 'fsharp/vim-fsharp', {
                \ 'for': 'fsharp',
                \ 'do' : 'install.cmd',
                \}
else
    Plug 'fsharp/vim-fsharp', {
                \ 'for': 'fsharp',
                \ 'do' : 'make fsautocomplete',
                \}
endif

if has("python")
    Plug 'OmniSharp/omnisharp-vim'
endif

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': g:languageClient_install,
    \ }

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" (Completion plugin option 2)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
let g:syntastic_cs_checkers = ['code_checker']

" Writing tools
" {{{
Plug 'reedes/vim-lexical'
Plug 'panozzaj/vim-autocorrect'
Plug 'reedes/vim-wordy'
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
if has("termguicolors")
    set termguicolors
endif
" Backspace workaround
set backspace=indent,eol,start
"{{{ Latex & markdown Settings

let g:vimtex_compiler_progname   = 'nvr'
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" For LaTeX files, activate "long line break" feature
" Note that a(english) word won't be broken into two lines
" And, add a color margin line for LaTeX mode!
"

function! WriterMode()
    nnoremap <buffer> <F5> :silent! NextWordy<CR>
    let g:lexical#thesaurus = ['~/thesaurus/words.txt', '~/thesaurus/mthesaur.txt','~/thesaurus/roget13a.txt' ]
    let g:lexical#spell = 1
    call lexical#init()
    "setlocal background=light
    nnoremap <buffer> <C-e><C-d> mZvapgq'Z
    setlocal smartindent
    let g:vsim_wrap_state = 0
    set wrap
endfunction

autocmd FileType tex call WriterMode()
autocmd FileType mkd call WriterMode()

"}}}

set background=light
colorscheme one

" highlight TermCursor gui=standout
" highlight TermCursor guibg=auto
" highlight TermCursor guifg=#ef2929

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
nmap <A-w> :bp<bar>sp<bar>bn<bar>bd<CR>
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
set completeopt=longest,menuone,preview

" Quicker navigation in tabs
nmap <C-tab> :bn<CR>
nmap <C-S-tab> :bp<CR>

" Enable airline fonts
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='one'
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

" fun with F8
function! PS1OutputHandle(output) abort
        echomsg json_encode(a:output)
endfunction

" fun with F8
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" fun with F8
function PSESRunCode()
    let codeString = s:get_visual_selection()
    :call LanguageClient#Call("evaluate", { 'expression': s:get_visual_selection() }, function("PS1OutputHandle"))
endfunction

"LanguageServerProtocol setup
"required for operations modifying multiple buffers like rename.
set hidden

" PSES sample startup code from VSCode:
"
"Start-EditorServices.ps1 -EditorServicesVersion '1.6.0'
"    -HostName 'Visual Studio Code Host'
"    -HostProfileId 'Microsoft.VSCode'
"    -HostVersion '1.6.0'
"    -AdditionalModules @('PowerShellEditorServices.VSCode') 
"    -BundledModulesPath '/Users/tylerleonhardt/.vscode-insiders/extensions/ms-vscode.powershell-1.6.0/modules' 
"    -EnableConsoleRepl 
"    -WaitForDebugger 
"    -LogLevel 'Verbose' 
"    -LogPath '/Users/tylerleonhardt/.vscode-insiders/extensions/ms-vscode.powershell-1.6.0/logs/1522110227-30bae385-70f5-4dbe-a322-88629604468f1522110215400/EditorServices.log' 
"    -SessionDetailsPath '/Users/tylerleonhardt/.vscode-insiders/extensions/ms-vscode.powershell-1.6.0/sessions/PSES-VSCode-1278-344124' 
"    -FeatureFlags @()

let g:LanguageClient_rootMarkers = {
    \ 'c': ['*.vcxproj'],
    \ 'cpp': ['*.vcxproj'],
    \}

let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ 'python': ['pyls'],
    \ 'ps1': ['powershell', '~\git\PowerShellEditorServices\module\Start-EditorServices.ps1', '-HostName', 'nvim', '-HostProfileId', '0', '-HostVersion', '1.0.0', '-EditorServicesVersion', '1.6.0', '-LogPath', '~\pses.log.txt', '-LogLevel', 'Diagnostic', '-BundledModulesPath', '~\git\PowerShellEditorServices\module', '-Stdio', '-SessionDetailsPath', '~\.pses_session'],
    \ 'cpp': ['C:\Tools\cquery\bin\cquery.exe', '--log-file=~\.log\cq.log'],
    \ 'c': ['C:\Tools\cquery\bin\cquery.exe', '--log-file=~\.log\cq.log'],
    \ }


autocmd FileType ps1 call VsimEnableLanguageServerKeys()
autocmd FileType ps1 call VsimEnablePSES_REPL()
autocmd FileType hs call VsimEnableLanguageServerKeys()
autocmd FileType py call VsimEnableLanguageServerKeys()
autocmd FileType c call VsimEnableLanguageServerKeys()
autocmd FileType cpp call VsimEnableLanguageServerKeys()

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

function! VsimEnablePSES_REPL()
    call LanguageClient#registerHandlers({'output': 'PS1OutputHandle'})
    vnoremap <silent> <F8> :call PSESRunCode()<CR>
endfunction

function! VsimEnableLanguageServerKeys()
    autocmd! CursorHold * call LanguageClient_textDocument_hover()
    set signcolumn=yes
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

" REPL and Neoterm
let g:neoterm_open_in_all_tabs = 1
let g:neoterm_autoinsert = 1

let g:vsim_dark = 0
function! VsimSetDark()
    let g:vsim_dark = 1
    " colorscheme Tomorrow-Night-Blue
    " set background=dark
endfunction

function! VsimToggleColor()
    if g:vsim_dark
        let g:vsim_dark = 0
        set background=light
        " colorscheme one
    else
        let g:vsim_dark = 1
        set background=dark
        " colorscheme Tomorrow-Night-Blue
    endif
endfunction

function! VsimOnTermEnter()
    if &buftype == 'terminal'
        if mode() != 'i'
            normal i
        endif
    endif
endfunction

function! VsimOnTermOpen()
    setlocal nobuflisted
    call VsimSetDark()
endfunction


inoremap <F5> <C-O>:TREPLSendLine<CR>
inoremap <C-F5> <C-O>:TREPLSendFile<CR>
nnoremap <F5> :TREPLSendLine<CR>
nnoremap <C-F5> :TREPLSendFile<CR>
vnoremap <F5> <C-O>:TREPLSendSelection<CR>

inoremap <F11> <C-O>:below Ttoggle<CR>
vnoremap <F11> <C-O>:below Ttoggle<CR>
nnoremap <F11> :below Ttoggle<CR>

inoremap <F9> <C-O>:call VsimToggleColor()<CR>
vnoremap <F9> <C-O>:call VsimToggleColor()<CR>
nnoremap <F9> :call VsimToggleColor()<CR>

tnoremap <A-Space> <C-\><C-n>
tnoremap <A-v> <C-\><C-n>v
tnoremap <A-PageUp> <C-\><C-n><PageUp>
tnoremap <A-PageDown> <C-\><C-n><PageDown>
tnoremap <PageUp> <C-\><C-n><PageUp>
tnoremap <PageDown> <C-\><C-n><PageDown>
tnoremap <F11> <C-\><C-n>:Ttoggle<CR>

autocmd TermOpen * call VsimOnTermOpen()
autocmd BufEnter * call VsimOnTermEnter()

"}}}
