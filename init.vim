" Environment for neovim

" Platform-specific variables
if has("win32")
    let g:plugged_dir      = '~/AppData/Local/nvim/plugged'
    let g:nvim_config_file = '~/AppData/Local/nvim/init.vim'
    let g:neoterm_eof      = "\r\n"
    let g:vsim_config_file ="~/AppData/Local/nvim/vsim.vim"
    set rtp^=~/AppData/Local/nvim/test
    " let g:neoterm_shell = "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe" "doesn't work..

    " http://vim.wikia.com/wiki/Adding_Vim_to_MS-Windows_File_Explorer_Menu
    " see second approach -- no shellext dll needed
else
    let g:plugged_dir      = '~/.config/nvim/plugged'
    let g:nvim_config_file = '~/.config/nvim/init.vim'
    if filereadable(expand('~/anaconda3/bin/python3'))
        let g:python3_host_prog = '~/anaconda3/bin/python3'
    endif
    let g:vsim_config_file ="~/.config/nvim/vsim.vim"
endif

let g:vsim_environment = "neovim"
execute "source " . g:vsim_config_file
