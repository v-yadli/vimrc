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
nmap <Leader>ss :source $MYVIMRC<CR>

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
command! -nargs=0 Vimrc :silent! tabnew $MYVIMRC

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
