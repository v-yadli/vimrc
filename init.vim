" Environment for neovim

" Platform-specific variables
if has("win32")
    let g:plugged_dir       = '~/AppData/Local/nvim/plugged'
    let g:nvim_config_file  = '~/AppData/Local/nvim/init.vim'
    let g:nvim_gconfig_file = '~/AppData/Local/nvim/ginit.vim'
    let g:neoterm_eof       = '\r\n'
    let g:vsim_config_file  = '~/AppData/Local/nvim/vsim.vim'
    let g:vsim_config_dir   = expand('~/AppData/Local/nvim')
    set rtp^=~/AppData/Local/nvim/test

    " http://vim.wikia.com/wiki/Adding_Vim_to_MS-Windows_File_Explorer_Menu
    " see second approach -- no shellext dll needed
else
    let g:plugged_dir       = '~/.config/nvim/plugged'
    let g:nvim_config_file  = '~/.config/nvim/init.vim'
    let g:nvim_gconfig_file = '~/.config/nvim/ginit.vim'
    if filereadable(expand('~/anaconda3/bin/python3'))
        let g:python3_host_prog = '~/anaconda3/bin/python3'
    endif
    let g:vsim_config_file ="~/.config/nvim/vsim.vim"
    let g:vsim_config_dir  ="~/.config/nvim"
endif

let g:vsim_environment = "neovim"
execute "source " . g:vsim_config_file
