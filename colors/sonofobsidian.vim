" Port of http://studiostyles.info/schemes/son-of-obsidian
" to vim
" Last Change: 2010 sep 28
" Version: 1.0
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="sonofobsidian"


hi Comment          guifg=#99AA8A
hi Normal           guifg=#FFFFFF guibg=#22282A
hi CursorLine       guibg=#32383A
hi CursorColumn     guibg=#32383A
hi Search           guibg=#808080
hi Visual           guifg=#FFFFFF guibg=#4F6164 
hi VisualNOS        guifg=#FFFFFF guibg=#4F6164 
hi Identifier       guifg=#FFFFFF
hi Number           guifg=#FFCD22 
hi Operator         guifg=#E8E2B7 
hi String           guifg=#EC7600 
hi FoldColumn       guifg=#FFFFFF guibg=#394144
hi LineNr           guifg=#3F4E49 guibg=#293134 
hi PreProc          guifg=#A082BD 
hi Keyword          guifg=#93C763
hi Conditional      guifg=#93C763
hi Statement        guifg=#93C763
hi Type             guifg=#93C763
hi Structure        guifg=#678CB1 
hi Tag              guifg=#93C763
hi xmlTagName       guifg=#93C763
hi xmlCdata         guifg=#99A38A
hi xmlAttrib        guifg=#678CB1
hi htmlTagName      guifg=#93C763
hi htmlArg          guifg=#678CB1
hi ErrorMsg         guifg=#FF0000
hi WarningMsg       guifg=#FFCD22
hi Folded           guifg=#808080 guibg=#1C2325
hi PMenu            guifg=#CCCCFF guibg=#1C2325
hi PMenuSel         guibg=#2C3335

" Coc highlighting
highlight      CocUnderline          gui=underline
highlight      CocErrorSign          guifg=#ff0000
highlight      CocWarningSign        guifg=#ff922b
highlight      CocInfoSign           guifg=#fab005
highlight      CocHintSign           guifg=#15aabf
highlight      CocSelectedText       guifg=#fb4394
highlight      CocCodeLens           guifg=#999999
highlight link CocErrorFloat         Identifier
highlight link CocWarningFloat       Constant
highlight link CocInfoFloat          Normal
highlight link CocHintFloat          Normal
highlight      CocErrorHighlight     gui=undercurl guisp=#ff0000
highlight      CocWarningHighlight   gui=underline guisp=#ff922b
highlight      CocInfoHighlight      gui=underline guisp=Green
highlight      CocHintHighlight      gui=underline guisp=#15aabf
highlight link CocListMode           ModeMsg
highlight link CocListPath           Comment
highlight link CocFloating           Pmenu
highlight link CocHighlightText      Pmenu
highlight link CocHighlightTextRead  Pmenu
highlight link CocHighlightTextWrite Pmenu

