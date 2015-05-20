" Vism -- Vim with Visual Studio key bindings.
" 
" Yatao Li<yatao.li@live.com>

"{{{ Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/_vim/bundle/Vundle.vim
let bundle_path='~/_vim/bundle'
call vundle#begin(bundle_path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'molokai'
Plugin 'Powerline'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
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
set wildmode=longest:full
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
" Bind ESC in normal mode to clear highlight search
nnoremap <Esc> :nohlsearch<CR><Esc>

"Set fonts according to OS {{{
if has("unix")
    set guifontwide=WenQuanYi\ Zen\ Hei\ 11
    set guifont=MonoSpace\ 11
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
autocmd FileType tex set formatoptions-=l
autocmd FileType tex set formatoptions+=m
autocmd FileType tex set colorcolumn=72
autocmd FileType tex nnoremap <C-F5> :!make.bat<CR>
"}}}
colorscheme molokai
" Nice one, finally worked out how to solve the puzzle!
function! SwitchColorScheme()
    if &ft =~ 'vimwiki\|tex'
        colorscheme molokai
    else
        colorscheme molokai
    endif
endfunction
autocmd BufEnter * call SwitchColorScheme()
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
nmap <Leader>ss :source ~/_vimrc<CR>

" Tab operations and buffer operations{{{
nmap <Leader>tt :tab new<CR>
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprevious<CR>
nmap <Leader>bf :buffers<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>ba :ba<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bd <C-w><C-v><C-l>:bn<CR><C-h>:bd<CR>
"}}}


" Bring back NERD-Tree
nmap <F3> :NERDTreeToggle<CR>
imap <F3> <Esc>:NERDTreeToggle<CR>

" Quick edit vimrc!
command! -nargs=0 Vimrc :silent! tabnew ~/_vim/vimrc

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

" Necessary Evil
set clipboard=unnamed
vmap <C-C> gy
vmap <C-V> gp

" Quicker navigation in tabs
nmap <C-tab> :tabnext<CR>
nmap <C-S-tab> :tabprevious<CR>
nmap <C-n> :tabnext<CR>
nmap <C-p> :tabprevious<CR>


" Vimwiki settings{{{
" \bn\bp:After generating the html files, it seems that vimwiki will
" lose syntax highlights. \bn\bp will switch between buffers, bringing
" them back.
let g:vimwiki_CJK_length=1
autocmd FileType vimwiki nmap <C-F5> :VimwikiAll2HTML<CR><CR>\bn\bp
autocmd FileType vimwiki imap <C-F5> <ESC>:VimwikiAll2HTML<CR><CR>\bn\bpi
autocmd FileType vimwiki set formatoptions-=t
let g:vimwiki_camel_case = 0
let g:vimwiki_CJK_length = 1
function! AddWikiTitle()
    let wiki_name = expand("%:t:r")
    execute "normal" "i= ".wiki_name." =\n"
endfunction
autocmd BufNewFile *.wiki call AddWikiTitle()
autocmd FileType vimwiki nmap <C-F6> <C-F5>:cd<Space><C-R>=g:vimwiki_list[0]['path_html']<CR><CR>:!update.bat<CR>
"Handle text files as wiki files
autocmd FileType txt set filetype=vimwiki
"}}}
