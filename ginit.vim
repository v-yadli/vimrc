if exists('g:GuiLoaded')
    GuiFont! Iosevka Term Slab:h12

    let g:vsim_fullscreen = 0

    function! VsimToggleFullScreen()
        if g:vsim_fullscreen
            let g:vsim_fullscreen = 0
        else
            let g:vsim_fullscreen = 1
        endif
        silent! call GuiWindowFullScreen(g:vsim_fullscreen)
    endfunction

    nnoremap <silent> <M-CR> :call VsimToggleFullScreen()<CR>
    inoremap <silent> <M-CR> <C-O>:call VsimToggleFullScreen()<CR>
endif

if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Iosevka Yadori Slab 12')
endif
