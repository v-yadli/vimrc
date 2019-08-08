" Environment for vim

let s:current_dir = expand("<sfile>:p:h")
let g:plugged_dir = s:current_dir . '/plugged'
let g:vsim_config_file= s:current_dir . '/vsim.vim'

let g:vsim_environment = "vim"
set guifont=Iosevka_Slab:h12

execute "source " . g:vsim_config_file
