" Vism -- Vim with Visual Studio key bindings.
"
" Yatao Li<yatao.li@live.com>

" Platform-specific variables
let g:vsim_init = 0
let g:polyglot_disabled = ['fsharp', 'latex', 'xml', 'v', 'vlang']

" Initialize plugin system
call plug#begin(g:plugged_dir)

" Solidworks -- Passive plugins/burned into the brain, fire and forget
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/LargeFile'
Plug 'guns/vim-sexp', {'for': ['lisp', 'clojure', 'cl', 'scheme', 'gasm']}
Plug 'bohlender/vim-smt2'
Plug 'kshenoy/vim-signature'          " displays marks in the gutter (sign column)
Plug 'mhinz/vim-signify'              " displays changes in the gutter
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'derekwyatt/vim-fswitch'
Plug 'godlygeek/tabular'              " Required by vim-markdown
Plug 'plasticboy/vim-markdown'
Plug 'gyim/vim-boxdraw'

" colorschemes
" Plug 'morhetz/gruvbox'
" Plug 'fenetikm/falcon'
" Plug 'NLKNguyen/papercolor-theme'

" mighty coc.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'jackguo380/vim-lsp-cxx-highlight' " <--- coc.nvim has native support for semantic hl, but no 'active regions'

" Utilities -- Things that I do love to issue Ex commands to utilize
Plug 'fidian/hexmode', { 'on': 'Hexmode' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'puremourning/vimspector'
" Plug 'F:/git/vimspector'

" Laborotary -- Things I'd love to know more about
" Plug 'jaawerth/fennel-nvim', { 'branch': 'dev' }
Plug 'Olical/conjure', { 'for': ['clojure', 'fennel', 'scheme'] }
" Plug 'Olical/aniseed', { 'tag': 'v3.11.0' }
Plug 'bakpakin/fennel.vim', { 'for': ['fennel'] }
Plug 'honza/vim-snippets'

" ---------------- neovim dev ----------------
" (OPTIONAL): This is a suggested plugin to get better Lua syntax highlighting
"   but it's not currently required
Plug 'euclidianAce/BetterLua.vim'
" ---------------- neovim dev end ------------


if g:vsim_environment=="neovim"
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kassio/neoterm'
    Plug 'romgrk/barbar.nvim'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'PProvost/vim-ps1'
else
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
endif

" Junkyard -- things that do not work for me, replaced, or never found useful.
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
" Plug 'rking/ag.vim'               <--- fzf has this(!)
" Plug 'KabbAmine/zeavim.vim'       <--- never calls Zeal actually...
" Plug 'qpkorr/vim-bufkill'         <--- replaced by vmux.vim
" Plug 'puremourning/vimspector'    <--- doesn't work well with NeoVim
" Plug 'scrooloose/nerdtree',       <--- replaced by coc-explorer
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'lervag/vimtex'
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

" Dev space!
Plug 'v-yadli/vim-tsl'
Plug 'yatli/sleigh.vim'
Plug 'yatli/vmux.vim'
Plug 'yatli/dsp56k.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'bfredl/nvim-luadev'
Plug 'yatli/gui-widgets.nvim'
Plug 'yatli/nvim-ipy'

" Initialize plugin system finish
call plug#end()

" For neovim development
lua <<EOF
function get_lua_runtime()
  local result = {};
  for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
    local lua_path = path .. "/lua/";
    if vim.fn.isdirectory(lua_path) == 1 then
      result[lua_path] = true
    end
  end

  -- This loads the `lua` files from nvim into the runtime.
  result[vim.fn.expand("$VIMRUNTIME/lua/")] = true
  result[vim.fn.expand("$VIMRUNTIME/vim/lsp/")] = true

  return result
end

--[[
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}
]]--
EOF
" let g:lua_config = luaeval('get_lua_runtime()')
" call coc#config('Lua.workspace.library', g:lua_config)
call coc#config('Lua.workspace.library', {
      \ $VIMRUNTIME . "/lua/": v:true,
      \ $VIMRUNTIME . "/lua/vim/lsp/": v:true
      \ })
call coc#config("Lua.runtime.version", "LuaJIT")
call coc#config('Lua.completion.keywordSnippet', 'Disable')
call coc#config('Lua.diagnostics.enable', v:true)
call coc#config('Lua.diagnostics.disable', ['trailing-space'])
call coc#config('Lua.diagnostics.globals', ['vim', 'describe', 'it', 'before_each', 'after_each', 'teardown', 'pending', 'clear'])

" coc-explorer bug repro
let g:coc_explorer_global_presets = {
      \ 'floating': {
        \ 'position': 'floating',
      \}
    \}
" to trigger:
" :CocCommand explorer --preset floating

filetype plugin indent on

set nowrap
set cindent
set title           " enable titlestring
set shiftwidth=2
set tabstop=2
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
" Necessity Evil Reloaded
" let g:vim_fakeclip_tmux_plus=1
if g:vsim_environment == "neovim"
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif
set completeopt=longest,menuone,preview
set previewheight=5
" remove blank from sessionoptions
set sessionoptions=buffers,curdir,folds,help,tabpages,winsize

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

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" let g:vimtex_view_general_viewer = 'SumatraPDF'
" let g:vimtex_view_general_options
"     \ = '-reuse-instance -forward-search @tex @line @pdf'
" let g:vimtex_view_general_options_latexmk = '-reuse-instance'
" let g:vimtex_compiler_latexmk = {
"     \ 'backend' : g:vsim_latexmk_backend,
"     \ 'background' : 1,
"     \ 'build_dir' : '',
"     \ 'callback' : 1,
"     \ 'continuous' : 1,
"     \ 'executable' : 'latexmk',
"     \ 'options' : [
"     \   '-shell-escape',
"     \   '-verbose',
"     \   '-file-line-error',
"     \   '-synctex=1',
"     \   '-interaction=nonstopmode',
"     \ ],
"     \}

function! WriterMode()
    nnoremap <buffer> <F5> :silent! NextWordy<CR>
    let g:lexical#thesaurus = ['~/thesaurus/words.txt', '~/thesaurus/mthesaur.txt','~/thesaurus/roget13a.txt' ]
    let g:lexical#spell = 1
    call lexical#init()
    setlocal smartindent
    setlocal concealcursor="n"
endfunction

let g:tex_flavor = "latex"

"}}}

set background=dark
let g:falcon_airline = 1
let g:falcon_inactive = 1
let g:falcon_background = 1

let g:airline_theme = 'falcon'
"let g:airline_theme='tomorrow'
"let g:airline_theme='gruvbox'

colorscheme Tomorrow-Night-Blue
"colorscheme PaperColor
let g:gruvbox_invert_selection=0
"colorscheme gruvbox
"colorscheme falcon
"colorscheme pencil
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait1000-blinkoff500-blinkon500-Cursor/lCursor
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

if exists("g:fvim_loaded")
    call coc#config('suggest.completionItemKindLabels', {
                \ "text": "t",
                \ "method": ":",
                \ "function": "f",
                \ "constructor": "c",
                \ "field": ".",
                \ "variable": "v",
                \ "class": "C",
                \ "interface": "I",
                \ "module": "M",
                \ "property": "p",
                \ "unit": "U",
                \ "value": "l",
                \ "enum": "E",
                \ "keyword": "k",
                \ "snippet": "s",
                \ "color": "K",
                \ "file": "F",
                \ "reference": "r",
                \ "folder": "d",
                \ "enumMember": "m",
                \ "constant": "0",
                \ "struct": "S",
                \ "event": "e",
                \ "operator": "o",
                \ "typeParameter": "T"
                \ })
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
    call coc#config('codeLens', {'separator': '▸'})
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
let g:airline#extensions#coc#get_error = 1
let g:airline#extensions#coc#get_warning = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_exclude_preview = 1
if g:vsim_environment=="neovim"
    " use barbar
    if !exists("g:bufferline")
      let g:bufferline = {}
    endif
    let g:bufferline.icons="both"
else
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s: '
    let g:airline#extensions#tabline#fnamemod = ':t'
endif
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
endfunction

" exclude overwrite statusline of list filetype
let g:airline_exclude_filetypes = ["list"]

let g:indentLine_char_list = [ '┆', '┊']
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileTypeExclude = ['coc-explorer', 'neoterm']

let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
let g:startify_session_before_save = [
            \ 'echo "Cleaning up before saving.."',
            \ ':CocCommand explorer --quit'
            \ ]
"if exists('g:fvim_startify')
    "Startify
"endif

""" Register a prefix-based key
function! s:vsim_key(prefix, key, cmd)
    let key = len(a:key) == 1 ? a:key : '<'.a:key.'>'
    let mapcmd =  a:cmd =~ '<Plug>' ? 'nmap' : 'nnoremap'
    execute mapcmd.' <silent> <buffer> <C-'.a:prefix.'>'.key.' '.a:cmd
    execute mapcmd.' <silent> <buffer> <C-'.a:prefix.'><C-'.a:key.'> '.a:cmd
endfunction

let g:vsim_debugger_mode = v:false

function! VsimDebuggerMode()
    let g:vsim_debugger_mode = v:true
    silent! nunmap <buffer> <F5>
    silent! nunmap <buffer> <S-F5>
    silent! nunmap <buffer> <C-S-F5>
    silent! nunmap <buffer> <F6>
    silent! nunmap <buffer> <ins>
    silent! nunmap <buffer> <F10>
    silent! nunmap <buffer> <S-F10>
    silent! nunmap <buffer> <F11>
    silent! nunmap <buffer> <S-F11>

    nmap <F5> <Plug>VimspectorContinue
    nmap <S-F5> <Plug>VimspectorStop
    nmap <C-S-F5> <Plug>VimspectorRestart
    nmap <F6> <Plug>VimspectorPause
    nmap <ins> <Plug>VimspectorToggleBreakpoint
    nmap <S-ins> <Plug>VimspectorToggleConditionalBreakpoint
    nmap <F10> <Plug>VimspectorStepOver
    nmap <S-F10> <Plug>VimspectorRunToCursor
    nmap <F11> <Plug>VimspectorStepInto
    nmap <S-F11> <Plug>VimspectorStepOut

    call s:vsim_key('c', 't', '<Plug>(vmux-term-toggle)')
endfunction

function! VsimProgrammerMode()

    set updatetime=300
    set signcolumn=yes
    augroup vsim_prog
      autocmd!
      autocmd CursorHold  * silent call CocActionAsync('highlight')
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup END

    setlocal nobackup
    setlocal nowritebackup

    setl formatexpr=CocAction('formatSelection')
    vmap     <buffer> <C-e><C-d> <Plug>(coc-format-selected)
    nmap     <buffer> <C-e><C-d> <Plug>(coc-format)
    vmap     <buffer> <C-e>d     <Plug>(coc-format-selected)
    nmap     <buffer> <C-e>d     <Plug><coc-format>

    nmap     <silent> <buffer> <C-.>      <Plug>(coc-codeaction)
    vmap     <silent> <buffer> <C-.>      <Plug>(coc-codeaction-selected)

    nnoremap <silent> <buffer> <S-K>      :call CocActionAsync('doHover')<CR>

    if &filetype == 'fsharp' || &filetype == 'vim'
        setlocal foldmethod=indent
    endif

    if &filetype == 'vim'
      nmap gh :call VimrcGetHelp()<cr>
    endif

    if &filetype == 'ps1'
        nnoremap <buffer> <F5> :CocCommand powershell.execute<CR>
        nnoremap <buffer> <F8> :CocCommand powershell.evaluateLine<CR>
        vnoremap <buffer> <F8> :<C-u>CocCommand powershell.evaluateSelection<CR>
    endif

    if &filetype == 'fsharp'
        nnoremap <buffer> <F5> :CocCommand fsharp.run<CR>
        nnoremap <buffer> <F8> :CocCommand fsharp.evaluateLine<CR>
        vnoremap <buffer> <F8> :<C-u>CocCommand fsharp.evaluateSelection<CR>
        call coc#config('coc.preferences.semanticTokensHighlight', v:false)
    endif

    if &filetype == 'lua'
        vmap <buffer> <Leader>rr <Plug>(Luadev-Run)
        nmap <buffer> <Leader>rr <Plug>(Luadev-Run)
        nmap <buffer> <Leader>rl <Plug>(Luadev-RunLine)
    endif

    nnoremap <silent> <buffer> <F1>       :call CocActionAsync('doHover')<CR>

    nmap     <buffer> <F2>                <Plug>(coc-rename)
    nmap     <silent> <buffer> <F12>      <Plug>(coc-definition)
    nmap     <silent> <buffer> <C-]>      <Plug>(coc-declaration)
    imap     <silent> <buffer> <C-l>      <Plug>(coc-snippets-expand)

    nmap     <silent> <buffer> gd         <Plug>(coc-definition)
    nmap     <silent> <buffer> gy         <Plug>(coc-type-definition)
    nmap     <silent> <buffer> gi         <Plug>(coc-implementation)
    nmap     <silent> <buffer> gr         <Plug>(coc-references)

    nmap     <silent> <buffer> <C-h>      <Plug>(coc-float-jump)
    imap     <silent> <buffer> <C-h>      <C-o>:call CocActionAsync('showSignatureHelp')<CR>

    call s:vsim_key('k', 'r',   '<Plug>(coc-references)')
    call s:vsim_key('c', 'p',   ':CocCommand<CR>')
    call s:vsim_key('c', '[',   '<Plug>(coc-diagnostic-prev)')
    call s:vsim_key('c', ']',   '<Plug>(coc-diagnostic-next)')
    call s:vsim_key('c', 'c',   ':CocListResume<CR>')
    call s:vsim_key('c', 'n',   ':CocNext<CR>')
    call s:vsim_key('c', 'b',   ':CocList buffers<CR>')
    call s:vsim_key('c', 'd',   ':CocList diagnostics<CR>')
    call s:vsim_key('c', 'f',   ':CocList files<CR>')
    call s:vsim_key('c', 'g',   ':CocList grep<CR>')
    call s:vsim_key('c', 's',   ':CocList symbols<CR>')
    call s:vsim_key('c', 'm',   ':CocList marks<CR>')
    call s:vsim_key('c', 'tab', ':CocList mru<CR>')
    call s:vsim_key('c', 'w',   ':CocList windows<CR>')

    if g:vsim_debugger_mode
      call VsimDebuggerMode()
    endif
endfunction

let g:coc_global_extensions=[
            \ 'coc-texlab',
            \ 'coc-json',
            \ 'coc-yaml',
            \ 'coc-tsserver',
            \ 'coc-jedi',
            \ 'coc-html',
            \ 'coc-highlight',
            \ 'coc-fsharp',
            \ 'coc-vimlsp',
            \ 'coc-powershell',
            \ 'coc-lists',
            \ 'coc-snippets',
            \ 'coc-xml',
            \ 'coc-marketplace',
            \ 'coc-explorer',
            \ 'coc-lua' ,
            \ ]
" \ 'coc-conjure'
" \ 'coc-sh',
" \ 'coc-vimtex',
"
let g:coc_filetype_map = {
            \ 'xslt': 'xml',
            \ }

"set runtimepath^=F:/git/coc-powershell
"set runtimepath^=F:/git/coc-omnisharp

" Quicker navigation in tabs^H^H^H^Hbuffers...
nmap <C-tab> :bn<CR>
nmap <C-S-tab> :bp<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" navigation settings
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

if g:vsim_environment=="neovim"
    let g:vmux_no_default_bindings=1
    " Magic buffer-picking mode
    nnoremap <silent> <A-f> :BufferPick<CR>
    " Sort automatically by...
    "   -- note, conflict with za
    "   nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
    "   nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
    " Re-order to previous/next
    nnoremap <silent>    <A-,> :BufferMovePrevious<CR>
    nnoremap <silent>    <A-.> :BufferMoveNext<CR>
    " Goto buffer in position...
    nnoremap <silent>    <A-1> :BufferGoto 1<CR>
    nnoremap <silent>    <A-2> :BufferGoto 2<CR>
    nnoremap <silent>    <A-3> :BufferGoto 3<CR>
    nnoremap <silent>    <A-4> :BufferGoto 4<CR>
    nnoremap <silent>    <A-5> :BufferGoto 5<CR>
    nnoremap <silent>    <A-6> :BufferGoto 6<CR>
    nnoremap <silent>    <A-7> :BufferGoto 7<CR>
    nnoremap <silent>    <A-8> :BufferGoto 8<CR>
    nnoremap <silent>    <A-9> :BufferLast<CR>

    " Quick buffer switch
    nmap <silent><expr> <A-n> &buftype=="terminal" ? "<Plug>(vmux-buf-next)" : ":BufferNext<CR>"
    nmap <silent><expr> <A-p> &buftype=="terminal" ? "<Plug>(vmux-buf-prev)" : ":BufferPrevious<CR>"
    nmap <silent><expr> <A-w> &buftype=="terminal" ? "<Plug>(vmux-buf-kill)" : ":BufferClose<CR>"
    tmap <silent> <A-n> <C-\><C-N><Plug>(vmux-buf-next)
    tmap <silent> <A-p> <C-\><C-N><Plug>(vmux-buf-prev)
    tmap <silent> <A-w> <C-\><C-N><Plug>(vmux-buf-kill)

    " Quick window split
    nmap <A-s> <Plug>(vmux-split-horizontal)
    nmap <A-v> <Plug>(vmux-split-vertical)
    nmap <A-q> <Plug>(vmux-split-close)

    tmap <A-s> <C-\><C-N><Plug>(vmux-split-horizontal)
    tmap <A-v> <C-\><C-N><Plug>(vmux-split-vertical)
    tmap <A-q> <C-\><C-N><Plug>(vmux-split-close)

    " Show/hide terminals
    imap <F11> <C-O><Plug>(vmux-term-toggle)
    vmap <F11> <C-O><Plug>(vmux-term-toggle)
    nmap <F11> <Plug>(vmux-term-toggle)
    tmap <F11> <C-\><C-n><Plug>(vmux-term-toggle)

    " Quick window resize
    nmap <A-Up>    <Plug>(vmux-resize-up)
    nmap <A-Down>  <Plug>(vmux-resize-down)
    nmap <A-Left>  <Plug>(vmux-resize-left)
    nmap <A-Right> <Plug>(vmux-resize-right)

    tmap <A-Up>    <C-\><C-N><Plug>(vmux-resize-up)i
    tmap <A-Down>  <C-\><C-N><Plug>(vmux-resize-down)i
    tmap <A-Left>  <C-\><C-N><Plug>(vmux-resize-left)i
    tmap <A-Right> <C-\><C-N><Plug>(vmux-resize-right)i

    " Tabs navigation
    nnoremap <C-A-t> :tabnew<CR>
    nnoremap <C-A-q> :tabclose<CR>
    nnoremap <C-A-n> :tabnext<CR>
    nnoremap <C-A-p> :tabprevious<CR>
else
    nnoremap <silent> <A-1> :1b<cr>
    nnoremap <silent> <A-2> :2b<cr>
    nnoremap <silent> <A-3> :3b<cr>
    nnoremap <silent> <A-4> :4b<cr>
    nnoremap <silent> <A-5> :5b<cr>
    nnoremap <silent> <A-6> :6b<cr>
    nnoremap <silent> <A-7> :7b<cr>
    nnoremap <silent> <A-8> :8b<cr>
    nnoremap <silent> <A-9> :9b<cr>
endif

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
inoremap <C-BS> <C-w>

" nmap <F6> :make<CR>

" <C-W> (window) family
nmap <C-w><C-s> :CocCommand explorer<CR>
imap <C-w><C-s> <Esc>:CocCommand explorer<CR>
nmap <C-w><C-u> :UndotreeToggle<CR>
imap <C-w><C-u> <Esc>:UndotreeToggle<CR>

nmap <C-w><C-e> <silent> :cwindow<CR>

" <C-=> for calling EasyAlign
nmap <C-=> <Plug>(EasyAlign)
vmap <C-=> <Plug>(EasyAlign)

let g:easy_align_delimiters = {
    \ '-': { 'pattern': '->\|<-' },
    \ }

" <C-k> (kontrol) family
nmap <C-k><C-r> <silent> :call VsimFindReferences()<CR>
vmap <C-k><C-c> <plug>NERDCommenterComment
vmap <C-k><C-u> <plug>NERDCommenterUncomment

nnoremap <C-c> <silent> <C-c>
nnoremap <C-k><C-c> <S-v>:call nerdcommenter#Comment("x", "Comment")<CR>
nnoremap <C-k><C-u> <S-v>:call nerdcommenter#Comment("x", "Uncomment")<CR>
nnoremap <C-k><C-o> :FSHere<CR>

" <C-e> (view) family
" set Wrap=OFF upon start
let s:vsim_wrap_state = 3
call VsimToggleWrap()

call s:vsim_key('e', 'w', ':call VsimToggleWrap()<CR>')
call s:vsim_key('e', 'l', ':call IndentLinesToggle()<CR>')
call s:vsim_key('e', 's', ':call LeadingSpaceToggle()<CR>')


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
let g:neoterm_autoinsert = 0
let g:neoterm_keep_term_open = 1
let g:neoterm_default_mod = ':belowright'

if has("win32")
    let g:neoterm_shell = "powershell"
    let g:neoterm_eof   = "\r"
endif

let s:vsim_theme_idx     = 0
let s:vsim_theme_name    = ['falcon', 'gruvbox', 'gruvbox', 'Tomorrow', 'Tomorrow-Night', 'Tomorrow-Night-Blue', 'pencil', 'pencil', 'colorzone', 'PaperColor', 'PaperColor']
let s:vsim_theme_bg      = ['dark',   'dark',    'light',   'light',    'dark',           'dark',                'light',  'dark',   'light',     'light',      'dark']
let s:vsim_theme_airline = ['falcon', 'gruvbox', 'gruvbox', 'tomorrow', 'tomorrow',       'tomorrow',            '',       '',       '',          'papercolor', 'papercolor']

function! VsimToggleColor()
    let s:vsim_theme_idx = s:vsim_theme_idx + 1
    if s:vsim_theme_idx >= len(s:vsim_theme_name)
        let s:vsim_theme_idx = 0
    endif

    let l:theme   = s:vsim_theme_name[s:vsim_theme_idx]
    let l:bg      = s:vsim_theme_bg[s:vsim_theme_idx]
    let l:airline = s:vsim_theme_airline[s:vsim_theme_idx]

    execute "colorscheme "    . l:theme
    execute "set background=" . l:bg

    if l:airline != ""
        let g:airline_theme = l:airline
        AirlineRefresh
    endif

    if exists('g:fvim_loaded')
        FVimFontNormalWeight (l:bg == 'dark') ? 300 : 400
    endif

    if l:bg == 'dark'
        hi LspCxxHlGroupEnumConstant ctermfg=Magenta guifg=#AD7FA8 cterm=none gui=none
        hi LspCxxHlGroupNamespace ctermfg=Yellow guifg=#BBBB00 cterm=none gui=none
        hi LspCxxHlGroupMemberVariable ctermfg=White guifg=White
    else
        hi LspCxxHlGroupEnumConstant ctermfg=Magenta guifg=#573F54 cterm=none gui=none
        hi LspCxxHlGroupNamespace ctermfg=Yellow guifg=#3D3D00 cterm=none gui=none
        hi LspCxxHlGroupMemberVariable ctermfg=Black guifg=Black
    endif

    call VsimEcho("Current theme: ". l:theme)
endfunction

inoremap <F9> <C-O>:call VsimToggleColor()<CR>
vnoremap <F9> <C-O>:call VsimToggleColor()<CR>
nnoremap <F9> :call VsimToggleColor()<CR>

"}}}

" from: https://vim.fandom.com/wiki/Convert_between_hex_and_decimal
command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

function! s:SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
command! -nargs=0 SynStack call s:SynStack()

" -- autocommands

augroup vsim
  autocmd! 
  " Bind ESC in normal mode to clear highlight search
  autocmd VimEnter * nnoremap <Esc> :nohlsearch<CR>
  autocmd FileType tex,mkd,markdown call WriterMode()
  " -- close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd User AirlineAfterInit call AirlineInit()
  autocmd FileType c,cpp,typescript,javascript,json,ps1,psm1,psd1,fsharp,cs,python,vim,xml,sh,cuda,verilog,vue,tex,lua,fnl call VsimProgrammerMode()
  autocmd TermOpen * if g:colors_name == g:vsim_termbg | setlocal winhighlight=Normal:VsimTermBackground | endif
augroup END

let g:vsim_init = 1
