if exists('g:GuiLoaded')
    GuiFont! Iosevka Slab:h12
    GuiTabline 0

    let s:vsim_fullscreen = 0

    function! VsimToggleFullScreen()
        if s:vsim_fullscreen
            let s:vsim_fullscreen = 0
        else
            let s:vsim_fullscreen = 1
        endif
        silent! call GuiWindowFullScreen(s:vsim_fullscreen)
        call _doVsimToggleFullScreen()
    endfunction

elseif exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font',   'Iosevka Slab 12')
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
    nnoremap <silent> <C-w><C-s> :call rpcnotify(1, 'Gui', 'Command', 'ToggleSidebar')<CR>
elseif exists('g:fvim_loaded')
    set guifont=Iosevka\ Slab:h14
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>

    function! VsimToggleFullScreen()
        call rpcnotify(1, 'ToggleFullScreen', 1)
    endfunction
endif

nnoremap <silent> <M-CR> :call VsimToggleFullScreen()<CR>
inoremap <silent> <M-CR> <C-O>:call VsimToggleFullScreen()<CR>
