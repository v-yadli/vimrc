" Tomorrow Night Blue - Full Colour and 256 Colour
" http://chriskempson.com
"
" Hex colour conversion functions borrowed from the theme "Desert256""


" Default GUI Colours
"

let s:foreground  = "#ffffff"
let s:background  = "#001631"
" let s:background  = "#002451"
let s:selection   = "#003f8e"
let s:line        = "#00346e"
let s:comment     = "#7285b7"
let s:red         = "#ff9da4"
let s:orange      = "#ffc58f"
let s:yellow      = "#ffeead"
let s:green       = "#d1f1a9"
let s:aqua        = "#99ffff"
let s:blue        = "#bbdaff"
let s:purple      = "#ebbbff"
let s:window      = "#4d5057"
let s:termbg      = "#0a102A"

hi clear
syntax reset

let g:colors_name = "Tomorrow-Night-Blue"
let g:vsim_termbg = g:colors_name

if has("gui_running") || &t_Co == 256
	" Sets the highlighting for the given group
	fun! <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=" . a:fg
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=" . a:bg
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr
		endif
	endfun

	" Vim Highlighting
	call <SID>X("Normal", s:foreground, s:background, "")
	call <SID>X("LineNr", s:selection, "", "")
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Search", s:background, s:yellow, "")
	call <SID>X("TabLine", s:window, s:foreground, "reverse")
	call <SID>X("TabLineFill", s:window, s:foreground, "reverse")
	call <SID>X("StatusLine", s:window, s:yellow, "reverse")
	call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
	call <SID>X("VertSplit", s:window, s:window, "none")
	call <SID>X("Visual", "", s:selection, "")
	call <SID>X("Directory", s:blue, "", "")
	call <SID>X("ModeMsg", s:green, "", "")
	call <SID>X("MoreMsg", s:green, "", "")
	call <SID>X("Question", s:green, "", "")
	call <SID>X("WarningMsg", s:red, "", "")
	call <SID>X("ErrorMsg", s:foreground, "6a2010", "")
	call <SID>X("MatchParen", "", s:selection, "")
	call <SID>X("Folded", s:comment, s:background, "")
	call <SID>X("FoldColumn", "", s:background, "")
	if version >= 700
		call <SID>X("CursorLine", "", s:line, "none")
		call <SID>X("CursorColumn", "", s:line, "none")
		call <SID>X("PMenu", s:foreground, s:selection, "none")
		call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
		call <SID>X("SignColumn", "", s:background, "none")
	end
	if version >= 703
		call <SID>X("ColorColumn", "", s:line, "none")
        highlight Cursor       guibg=#ef1810 guifg=fg
        highlight CursorLineNr guifg=Brown
	end

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

  " Bar Bar Jinks (
	call <SID>X(  "BufferCurrent",       s:foreground, s:background, "")
  call <SID>X( 	"BufferCurrentSign",   "#ef1810", s:background, "")
  call <SID>X( 	"BufferCurrentMod",    s:red, s:background, "")
  call <SID>X( 	"BufferCurrentTarget", "#ef1810", s:background, "bold")
  call <SID>X( 	"BufferCurrentIndex",  s:foreground, s:background, "bold")

	call <SID>X(  "BufferVisible",       s:foreground, s:selection, "")
	call <SID>X(  "BufferVisibleSign",   s:window, s:selection, "")
	call <SID>X(  "BufferVisibleMod",    s:red, s:selection, "")
	call <SID>X(  "BufferVisibleTarget", "#ef1810", s:selection, "bold")
	call <SID>X(  "BufferVisibleIndex",  s:foreground, s:selection, "")

	call <SID>X(  "BufferInactive",      '#bababa', s:window, "")
  call <SID>X( 	"BufferInactiveSign",  '#151515', s:window, "")
  call <SID>X( 	"BufferInactiveMod",   s:red, s:window, "")
  call <SID>X( 	"BufferInactiveTarget","#ef1810", s:window, "bold")
	call <SID>X(  "BufferInactiveIndex", '#bababa', s:window, "")

  call <SID>X( 	"BufferTabpages",      s:background, s:foreground, "")
  call <SID>X( 	"BufferTabpageFill",   s:background, s:selection, "")

   if has('nvim')
    hi! link TermCursor Cursor
    hi TermCursorNC ctermfg=230 ctermbg=247 guifg=#fdf6e3 guibg=#93a1a1 guisp=NONE cterm=NONE gui=NONE
		call <SID>X("VsimTermBackground",  s:foreground, s:termbg, "")
  endif 

	" Standard Highlighting
	call <SID>X("Comment", s:comment, "", "")
	call <SID>X("Todo", s:comment, s:background, "")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Identifier", s:red, "", "none")
	call <SID>X("Statement", s:foreground, "", "")
	call <SID>X("Conditional", s:foreground, "", "")
	call <SID>X("Repeat", s:foreground, "", "")
	call <SID>X("Structure", s:purple, "", "")
	call <SID>X("Function", s:blue, "", "")
	call <SID>X("Constant", s:orange, "", "")
	call <SID>X("Keyword", s:orange, "", "")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Special", s:foreground, "", "")
	call <SID>X("PreProc", s:purple, "", "")
	call <SID>X("Operator", s:aqua, "", "none")
	call <SID>X("Type", s:blue, "", "none")
	call <SID>X("Define", s:purple, "", "none")
	call <SID>X("Include", s:blue, "", "")
	"call <SID>X("Ignore", "#666666", "", "")

	" Vim Highlighting
	call <SID>X("vimCommand", s:red, "", "none")

	" C Highlighting
	call <SID>X("cType", s:yellow, "", "")
	call <SID>X("cStorageClass", s:purple, "", "")
	call <SID>X("cConditional", s:purple, "", "")
	call <SID>X("cRepeat", s:purple, "", "")

	" PHP Highlighting
	call <SID>X("phpVarSelector", s:red, "", "")
	call <SID>X("phpKeyword", s:purple, "", "")
	call <SID>X("phpRepeat", s:purple, "", "")
	call <SID>X("phpConditional", s:purple, "", "")
	call <SID>X("phpStatement", s:purple, "", "")
	call <SID>X("phpMemberSelector", s:foreground, "", "")

	" Ruby Highlighting
	call <SID>X("rubySymbol", s:green, "", "")
	call <SID>X("rubyConstant", s:yellow, "", "")
	call <SID>X("rubyAccess", s:yellow, "", "")
	call <SID>X("rubyAttribute", s:blue, "", "")
	call <SID>X("rubyInclude", s:blue, "", "")
	call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
	call <SID>X("rubyCurlyBlock", s:orange, "", "")
	call <SID>X("rubyStringDelimiter", s:green, "", "")
	call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
	call <SID>X("rubyConditional", s:purple, "", "")
	call <SID>X("rubyRepeat", s:purple, "", "")
	call <SID>X("rubyControl", s:purple, "", "")
	call <SID>X("rubyException", s:purple, "", "")

	" Crystal Highlighting
	call <SID>X("crystalSymbol", s:green, "", "")
	call <SID>X("crystalConstant", s:yellow, "", "")
	call <SID>X("crystalAccess", s:yellow, "", "")
	call <SID>X("crystalAttribute", s:blue, "", "")
	call <SID>X("crystalInclude", s:blue, "", "")
	call <SID>X("crystalLocalVariableOrMethod", s:orange, "", "")
	call <SID>X("crystalCurlyBlock", s:orange, "", "")
	call <SID>X("crystalStringDelimiter", s:green, "", "")
	call <SID>X("crystalInterpolationDelimiter", s:orange, "", "")
	call <SID>X("crystalConditional", s:purple, "", "")
	call <SID>X("crystalRepeat", s:purple, "", "")
	call <SID>X("crystalControl", s:purple, "", "")
	call <SID>X("crystalException", s:purple, "", "")

	" Python Highlighting
	call <SID>X("pythonInclude", s:purple, "", "")
	call <SID>X("pythonStatement", s:purple, "", "")
	call <SID>X("pythonConditional", s:purple, "", "")
	call <SID>X("pythonRepeat", s:purple, "", "")
	call <SID>X("pythonException", s:purple, "", "")
	call <SID>X("pythonFunction", s:blue, "", "")
	call <SID>X("pythonPreCondit", s:purple, "", "")
	call <SID>X("pythonRepeat", s:aqua, "", "")
	call <SID>X("pythonExClass", s:orange, "", "")

	" JavaScript Highlighting
	call <SID>X("javaScriptBraces", s:foreground, "", "")
	call <SID>X("javaScriptFunction", s:purple, "", "")
	call <SID>X("javaScriptConditional", s:purple, "", "")
	call <SID>X("javaScriptRepeat", s:purple, "", "")
	call <SID>X("javaScriptNumber", s:orange, "", "")
	call <SID>X("javaScriptMember", s:orange, "", "")
	call <SID>X("javascriptNull", s:orange, "", "")
	call <SID>X("javascriptGlobal", s:blue, "", "")
	call <SID>X("javascriptStatement", s:red, "", "")

	" CoffeeScript Highlighting
	call <SID>X("coffeeRepeat", s:purple, "", "")
	call <SID>X("coffeeConditional", s:purple, "", "")
	call <SID>X("coffeeKeyword", s:purple, "", "")
	call <SID>X("coffeeObject", s:yellow, "", "")

	" HTML Highlighting
	call <SID>X("htmlTag", s:red, "", "")
	call <SID>X("htmlTagName", s:red, "", "")
	call <SID>X("htmlArg", s:red, "", "")
	call <SID>X("htmlScriptTag", s:red, "", "")

	" Diff Highlighting
	call <SID>X("diffAdd", "", "4c4e39", "")
	call <SID>X("diffDelete", s:background, s:red, "")
	call <SID>X("diffChange", "", "2b5b77", "")
	call <SID>X("diffText", s:line, s:blue, "")

	" ShowMarks Highlighting
	call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
	call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
	call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
	call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")

	" Lua Highlighting
	call <SID>X("luaStatement", s:purple, "", "")
	call <SID>X("luaRepeat", s:purple, "", "")
	call <SID>X("luaCondStart", s:purple, "", "")
	call <SID>X("luaCondElseif", s:purple, "", "")
	call <SID>X("luaCond", s:purple, "", "")
	call <SID>X("luaCondEnd", s:purple, "", "")

	" Cucumber Highlighting
	call <SID>X("cucumberGiven", s:blue, "", "")
	call <SID>X("cucumberGivenAnd", s:blue, "", "")

	" Go Highlighting
	call <SID>X("goDirective", s:purple, "", "")
	call <SID>X("goDeclaration", s:purple, "", "")
	call <SID>X("goStatement", s:purple, "", "")
	call <SID>X("goConditional", s:purple, "", "")
	call <SID>X("goConstants", s:orange, "", "")
	call <SID>X("goTodo", s:yellow, "", "")
	call <SID>X("goDeclType", s:blue, "", "")
	call <SID>X("goBuiltins", s:purple, "", "")
	call <SID>X("goRepeat", s:purple, "", "")
	call <SID>X("goLabel", s:purple, "", "")

	" Clojure Highlighting
	call <SID>X("clojureConstant", s:orange, "", "")
	call <SID>X("clojureBoolean", s:orange, "", "")
	call <SID>X("clojureCharacter", s:orange, "", "")
	call <SID>X("clojureKeyword", s:green, "", "")
	call <SID>X("clojureNumber", s:orange, "", "")
	call <SID>X("clojureString", s:green, "", "")
	call <SID>X("clojureRegexp", s:green, "", "")
	call <SID>X("clojureParen", s:aqua, "", "")
	call <SID>X("clojureVariable", s:yellow, "", "")
	call <SID>X("clojureCond", s:blue, "", "")
	call <SID>X("clojureDefine", s:purple, "", "")
	call <SID>X("clojureException", s:red, "", "")
	call <SID>X("clojureFunc", s:blue, "", "")
	call <SID>X("clojureMacro", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureSpecial", s:purple, "", "")
	call <SID>X("clojureQuote", s:blue, "", "")
	call <SID>X("clojureUnquote", s:blue, "", "")
	call <SID>X("clojureMeta", s:blue, "", "")
	call <SID>X("clojureDeref", s:blue, "", "")
	call <SID>X("clojureAnonArg", s:blue, "", "")
	call <SID>X("clojureRepeat", s:blue, "", "")
	call <SID>X("clojureDispatch", s:blue, "", "")

	" Scala Highlighting
	call <SID>X("scalaKeyword", s:purple, "", "")
	call <SID>X("scalaKeywordModifier", s:purple, "", "")
	call <SID>X("scalaOperator", s:blue, "", "")
	call <SID>X("scalaPackage", s:red, "", "")
	call <SID>X("scalaFqn", s:foreground, "", "")
	call <SID>X("scalaFqnSet", s:foreground, "", "")
	call <SID>X("scalaImport", s:purple, "", "")
	call <SID>X("scalaBoolean", s:orange, "", "")
	call <SID>X("scalaDef", s:purple, "", "")
	call <SID>X("scalaVal", s:purple, "", "")
	call <SID>X("scalaVar", s:aqua, "", "")
	call <SID>X("scalaClass", s:purple, "", "")
	call <SID>X("scalaObject", s:purple, "", "")
	call <SID>X("scalaTrait", s:purple, "", "")
	call <SID>X("scalaDefName", s:blue, "", "")
	call <SID>X("scalaValName", s:foreground, "", "")
	call <SID>X("scalaVarName", s:foreground, "", "")
	call <SID>X("scalaClassName", s:foreground, "", "")
	call <SID>X("scalaType", s:yellow, "", "")
	call <SID>X("scalaTypeSpecializer", s:yellow, "", "")
	call <SID>X("scalaAnnotation", s:orange, "", "")
	call <SID>X("scalaNumber", s:orange, "", "")
	call <SID>X("scalaDefSpecializer", s:yellow, "", "")
	call <SID>X("scalaClassSpecializer", s:yellow, "", "")
	call <SID>X("scalaBackTick", s:green, "", "")
	call <SID>X("scalaRoot", s:foreground, "", "")
	call <SID>X("scalaMethodCall", s:blue, "", "")
	call <SID>X("scalaCaseType", s:yellow, "", "")
	call <SID>X("scalaLineComment", s:comment, "", "")
	call <SID>X("scalaComment", s:comment, "", "")
	call <SID>X("scalaDocComment", s:comment, "", "")
	call <SID>X("scalaDocTags", s:comment, "", "")
	call <SID>X("scalaEmptyString", s:green, "", "")
	call <SID>X("scalaMultiLineString", s:green, "", "")
	call <SID>X("scalaUnicode", s:orange, "", "")
	call <SID>X("scalaString", s:green, "", "")
	call <SID>X("scalaStringEscape", s:green, "", "")
	call <SID>X("scalaSymbol", s:orange, "", "")
	call <SID>X("scalaChar", s:orange, "", "")
	call <SID>X("scalaXml", s:green, "", "")
	call <SID>X("scalaConstructorSpecializer", s:yellow, "", "")
	call <SID>X("scalaBackTick", s:blue, "", "")

	" Git
	call <SID>X("diffAdded", s:green, "", "")
	call <SID>X("diffRemoved", s:red, "", "")
	call <SID>X("gitcommitSummary", "", "", "bold")

	" Delete Functions
	delf <SID>X
endif

set background=dark
