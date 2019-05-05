if exists('g:GuiLoaded')
    GuiFont! Iosevka Slab:h12
    GuiTabline 0

    function! _doVsimToggleFullScreen()
        silent! call GuiWindowFullScreen(g:vsim_fullscreen)
    endfunction

elseif exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font',   'Iosevka Slab 12')
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
    nnoremap <silent> <C-w><C-s> :call rpcnotify(1, 'Gui', 'Command', 'ToggleSidebar')<CR>
elseif exists('g:fvim_loaded')
    set guifont=Iosevka\ Slab:h16
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
endif

let g:vsim_fullscreen = 0

function! VsimToggleFullScreen()
    if g:vsim_fullscreen
        let g:vsim_fullscreen = 0
    else
        let g:vsim_fullscreen = 1
    endif
    call _doVsimToggleFullScreen()
endfunction

nnoremap <silent> <M-CR> :call VsimToggleFullScreen()<CR>
inoremap <silent> <M-CR> <C-O>:call VsimToggleFullScreen()<CR>
