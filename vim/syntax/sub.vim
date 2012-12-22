" Vim syntax file
" Language:	Syntax highlighting for subtitle files in MicroDVD (sub) format
" Maintainer:	Josip Deanovic <djosip@croadria.com>
" Last Change:	2002 Aug 17

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
     syntax clear
  elseif exists("b:current_syntax")
     finish
  endif
  let main_syntax = 'sub'
endif


syn case ignore


syn match  subComment "^#.*"
syn match subFrames contained "[0-9]"
syn match subPipe "|"
syn match subError contained "[a-zA-Z,.;:/*\\!\"#$%&()=?*+\-'{| ]"
syn match subBraces contained "[{}]"
syn region transparent matchgroup=subBraces start='{' end='}' contains=subFrames,subError
syn match  subError  "{y:[bi]}"
syn match  subError  "{y:[bi][bi]}"


if main_syntax == "sub"
   syn sync minlines=10
endif


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sub_syn_inits")
  if version < 508
     let did_sub_syn_inits = 1
     command -nargs=+ HiLink hi link <args>
  else
     command -nargs=+ HiLink hi def link <args>
  endif

  HiLink subFrames Number
  HiLink subBraces Statement
  HiLink subPipe Type
  HiLink subError Error
  HiLink subComment Comment
  delcommand HiLink

endif

let b:current_syntax = "sub"

if main_syntax == 'sub'
   unlet main_syntax
endif

" vim: ts=8

