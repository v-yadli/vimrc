" Vim syntax file
" Language:	GNU Assembler
" Maintainer:	Erik Wognsen <erik.wognsen@gmail.com>
"		Previous maintainer:
"		Kevin Dahlhausen <kdahlhaus@yahoo.com>
" Last Change:	2014 Feb 04

" Thanks to Ori Avtalion for feedback on the comment markers!

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" storage types
syn keyword asmType ds
syn keyword asmType dc


syn region asmString       start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region asmString       start=+'+ skip=+\\\\\|\\'+ end=+'+

syn match asmLabel		"^[a-z_][a-z0-9_]*"
syn match asmIdentifier		"[a-z_][a-z0-9_]*"

" Various #'s as defined by GAS ref manual sec 3.6.2.1
" Technically, the first decNumber def is actually octal,
" since the value of 0-7 octal is the same as 0-7 decimal,
" I (Kevin) prefer to map it as decimal:
syn match decNumber		"[1-9]\d*"
" syn match octNumber		"0[0-7][0-7]\+"
syn match hexNumber		"\$[0-9a-fA-F]\+"
" syn match binNumber		"0[bB][0-1]*"

syn keyword asmTodo		contained TODO

syn match asmComment		"[;].*" contains=asmTodo

" Advanced users of specific architectures will probably want to change the
" comment highlighting or use a specific, more comprehensive syntax file.

syn keyword asmInclude		include
syn keyword asmCond		if
syn keyword asmCond		else
syn keyword asmCond		endif
syn keyword asmMacro            define
syn keyword asmMacro            undef
syn keyword asmMacro            equ

" Assembler directives start with a '.' and may contain upper case (e.g.,
" .ABORT), numbers (e.g., .p2align), dash (e.g., .app-file) and underscore in
" CFI directives (e.g., .cfi_startproc). This will also match labels starting
" with '.', including the GCC auto-generated '.L' labels.
syn keyword asmDirective        org
syn keyword asmDirective        list
syn keyword asmDirective        nolist
syn keyword asmDirective        page
syn keyword asmDirective        opt
syn keyword asmDirective        buffer
syn keyword asmLabel            begin_loop
syn keyword asmLabel            end_loop


syn case match

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

" The default methods for highlighting.  Can be overridden later
hi def link asmSection	Special
hi def link asmLabel	Label
hi def link asmIdentifier Identifier
hi def link asmComment	Comment
hi def link asmTodo	Todo
hi def link asmDirective	Statement

hi def link asmInclude	Include
hi def link asmCond	PreCondit
hi def link asmMacro	Macro

hi def link hexNumber	Number
hi def link decNumber	Number
hi def link octNumber	Number
hi def link binNumber	Number

hi def link asmType	Type
hi def link asmString String


let b:current_syntax = "asm56k"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8

