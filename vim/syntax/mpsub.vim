" Vim syntax file
" Language:     Syntax highlighting for subtitle files in Mplayer (mpsub) format
" Maintainer:   Josip Deanovic <djosip@croadria.com>
" Last Change:  2003 Jun 29

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
     syntax clear
  elseif exists("b:current_syntax")
     finish
  endif
  let main_syntax = 'mpsub'
endif


syn case ignore


syn match mpsubComment "#.*"
syn match mpsubNumber "^\([0-9]\+\|[0-9]\+\.[0-9]*\) \([0-9]\+\|[0-9]\+\.[0-9]\+\)$"
syn match mpsubOperator "="
syn region transparent matchgroup=mpsubTitle start='TITLE' end='[-a-zA-Z0-9 \(\)\\+,\.:!?_/%;\"\']*$' contains=mpsubOperator
syn region transparent matchgroup=mpsubFile start='FILE' end='[0-9]\+,[a-zA-Z0-9]*' contains=mpsubOperator,mpsubComment
syn region transparent matchgroup=mpsubAuthor start='AUTHOR' end='[-a-zA-Z0-9 \(\)\\+,\.:!?_/%;\"\']*$' contains=mpsubOperator
syn region transparent matchgroup=mpsubType start='TYPE' end='VIDEO' contains=mpsubOperator,mpsubComment
syn region transparent matchgroup=mpsubFormat start='FORMAT' end='[0-9]\+,[0-9]\+\|TIME\|[0-9]\+' contains=mpsubOperator,mpsubComment
syn region transparent matchgroup=mpsubNote start='NOTE' end='[-a-zA-Z0-9 \(\)\\+,\.:!?_/%;\"\']*$' contains=mpsubOperator
syn match mpsubError "{y:[bi]}"
syn match mpsubError "{y:[bi][bi]}"
syn match mpsubError "\[br\]"


if main_syntax == "mpsub"
   syn sync minlines=10
endif


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_mpsub_syn_inits")
  if version < 508
     let did_mpsub_syn_inits = 1
     command -nargs=+ HiLink hi link <args>
  else
     command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mpsubComment Comment
  HiLink mpsubNumber Number
  HiLink mpsubTitle Type
  HiLink mpsubFile Type
  HiLink mpsubAuthor Type
  HiLink mpsubType Type
  HiLink mpsubFormat Type
  HiLink mpsubNote Type
  HiLink mpsubOperator Statement
  HiLink mpsubError Error
  delcommand HiLink

endif

let b:current_syntax = "mpsub"

if main_syntax == 'mpsub'
   unlet main_syntax
endif

" vim: ts=8

