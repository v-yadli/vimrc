" Environment for neovim

" Platform-specific variables
if has("win32")
    let g:plugged_dir     = '~/vimfiles/plugged'
    let g:vsim_config_file="~/vimfiles/vsim.vim"
    " http://vim.wikia.com/wiki/Adding_Vim_to_MS-Windows_File_Explorer_Menu
    " see second approach -- no shellext dll needed
else
    let g:plugged_dir     = '~/.vim/plugged'
    let g:vsim_config_file="~/.vim/vsim.vim"
endif

let g:vsim_environment = "vim"
set guifont=Iosevka_Slab:h12

execute "source " . g:vsim_config_file
