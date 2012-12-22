" euphrasia
" colour scheme for Vim & GVIM
" Author:  bohoomil
" Date:    October, 2012
" Release: 1.0
"
" This theme is supposed to be used
" with the euphrasia .Xdefaults colour settings.
" The GUI part is .Xdefaults independent.

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="euphrasia"

"
" terminal zone
"
if &t_Co > 255
	hi Normal                  ctermfg=none
	hi Boolean                 ctermfg=13
	hi Character               ctermfg=15
	hi Comment                 ctermfg=8    ctermbg=none cterm=none
	hi Conditional             ctermfg=6
	hi Constant                ctermfg=3
	hi Cursor                               ctermbg=2
	hi Debug                   ctermfg=13
	hi Define                  ctermfg=11
	hi Delimiter               ctermfg=8
	hi DiffLine                ctermfg=4 
	hi DiffOldLine             ctermfg=1    ctermbg=none
	hi DiffOldFile             ctermfg=1    ctermbg=none
	hi DiffNewFile             ctermfg=2    ctermbg=none
	hi DiffAdd                 ctermfg=10   ctermbg=none
	hi DiffAdded               ctermfg=10   ctermbg=none
	hi DiffDelete              ctermfg=1    ctermbg=none
	hi DiffRemoved             ctermfg=1    ctermbg=none
	hi DiffChange              ctermfg=6    ctermbg=none
	hi DiffChanged             ctermfg=6    ctermbg=none
	hi DiffText                ctermfg=4    ctermbg=none
	hi Directory               ctermfg=2
	hi Error                   ctermfg=9    ctermbg=none
	hi ErrorMsg                ctermfg=9    ctermbg=none
	hi Exception               ctermfg=13
	hi Float                   ctermfg=14
	hi FoldColumn              ctermfg=14   ctermbg=none
	hi Folded                  ctermfg=14   ctermbg=0
	hi Function                ctermfg=3
	hi Identifier              ctermfg=11                cterm=none
	hi IncSearch               ctermfg=15   ctermbg=1
	hi Keyword                 ctermfg=4
	hi Label                   ctermfg=5
	hi LineNr                  ctermfg=8
	hi CursorLine              ctermfg=15   ctermbg=0    cterm=bold
	hi CursorLineNr            ctermfg=15   ctermbg=4
	hi Macro                   ctermfg=3                 cterm=none
	hi MatchParen              ctermfg=0    ctermbg=14
	hi ModeMsg                 ctermfg=11
	hi MoreMsg                 ctermfg=14
	hi NonText                 ctermfg=8    ctermbg=none
	hi Number                  ctermfg=10
	hi Operator                ctermfg=13
	hi PreCondit               ctermfg=13   ctermbg=none cterm=none
	hi PreProc                 ctermfg=14
	hi Question                ctermfg=14
	hi Repeat                  ctermfg=14
	hi Search                  ctermfg=15   ctermbg=1
	hi SpecialChar             ctermfg=13
	hi SpecialComment          ctermfg=8
	hi Special                 ctermfg=13
	hi SpecialKey              ctermfg=10
	hi Statement               ctermfg=4    ctermbg=none
	hi StorageClass            ctermfg=4
	hi String                  ctermfg=2    ctermbg=none
	hi Structure               ctermfg=67
	hi Tag                     ctermfg=5
	hi Title                   ctermfg=7    ctermbg=none cterm=bold
	hi Todo                    ctermfg=10   ctermbg=0
	hi Typedef                 ctermfg=4
	hi Type                    ctermfg=5
	hi Underlined              ctermfg=7
	hi VertSplit               ctermfg=0    ctermbg=11
	hi Visual                  ctermfg=15   ctermbg=8
	hi VisualNOS               ctermfg=10   ctermbg=8    cterm=bold
	hi WarningMsg              ctermfg=9   
	hi WildMenu                ctermfg=5    ctermbg=0

	" statusline
	hi StatusLine              ctermfg=7    ctermbg=0    cterm=none
	hi StatusLineNC            ctermfg=0    ctermbg=7
	hi StatusModFlag           ctermfg=9    ctermbg=0    cterm=none
	hi StatusRO                ctermfg=13   ctermbg=0    cterm=none
	hi StatusHLP               ctermfg=10   ctermbg=0    cterm=none
	hi StatusPRV               ctermfg=11   ctermbg=0    cterm=none
	hi StatusFTP               ctermfg=12   ctermbg=0    cterm=none

	" spellchecking
	hi SpellLocal              ctermfg=0    ctermbg=14   cterm=underline
	hi SpellBad                ctermfg=15   ctermbg=1    cterm=underline
	hi SpellCap                ctermfg=0    ctermbg=12   cterm=underline
	hi SpellRare               ctermfg=0    ctermbg=13   cterm=underline

	" pmenu
	hi Pmenu                   ctermfg=7    ctermbg=0
	hi PmenuSel                ctermfg=none ctermbg=8 
	hi PmenuSbar               ctermfg=8    ctermbg=15

	" html
	hi htmlTag                 ctermfg=12
	hi htmlEndTag              ctermfg=12
	hi htmlTagName             ctermfg=11

	" xml
	hi xmlTag                  ctermfg=4
	hi xmlEndTag               ctermfg=4
	hi xmlTagName              ctermfg=3

	" perl
	hi perlStatement           ctermfg=13
	hi perlStatementStorage    ctermfg=1
	hi perlVarPlain            ctermfg=6
	hi perlVarPlain2           ctermfg=11

	" mini buffer explorer
	hi MBENormal               ctermfg=8
	hi MBEChanged              ctermfg=1
	hi MBEVisibleNormal        ctermfg=5
	hi MBEVisibleNormalActive  ctermfg=13
	hi MBEVisibleChanged       ctermfg=7
	hi MBEVisibleChangedActive ctermfg=9

	" rst
	hi rstEmphasis             ctermfg=7                 cterm=underline
	hi rstLiteralBlock         ctermfg=3
	hi rstInlineLiteral        ctermfg=11
	hi rstSections             ctermfg=1
	hi rstHyperlinkTarget      ctermfg=6
	hi rstStandaloneHyperlink  ctermfg=10
	hi rstInterpretedTextOrHyperlinkReference ctermfg=10
	hi rstCitation             ctermfg=7
	hi rstQuotedLiteralBlock   ctermfg=11
	hi rstLineBlock            ctermfg=6

else "linux console settings

	hi Normal                  ctermfg=white
	hi Boolean                 ctermfg=magenta                 cterm=bold
	hi Character               ctermfg=white
	hi Comment                 ctermfg=black   ctermbg=none    cterm=bold
	hi Conditional             ctermfg=cyan
	hi Constant                ctermfg=yellow
	hi Debug                   ctermfg=magenta                 cterm=bold
	hi Define                  ctermfg=yellow                  cterm=bold
	hi Delimiter               ctermfg=black                   cterm=bold
	hi DiffLine                ctermfg=blue
	hi DiffOldLine             ctermfg=red     ctermbg=none
	hi DiffOldFile             ctermfg=red     ctermbg=none
	hi DiffNewFile             ctermfg=green   ctermbg=none
	hi DiffAdd                 ctermfg=green   ctermbg=none    cterm=bold
	hi DiffAdded               ctermfg=green   ctermbg=none    cterm=bold
	hi DiffDelete              ctermfg=red     ctermbg=none
	hi DiffRemoved             ctermfg=red     ctermbg=none
	hi DiffChange              ctermfg=cyan    ctermbg=none
	hi DiffChanged             ctermfg=cyan    ctermbg=none
	hi DiffText                ctermfg=blue    ctermbg=none    cterm=bold
	hi Directory               ctermfg=green
	hi Error                   ctermfg=red     ctermbg=none    cterm=bold
	hi ErrorMsg                ctermfg=red     ctermbg=none    cterm=bold
	hi Exception               ctermfg=magenta                 cterm=bold
	hi Float                   ctermfg=cyan                    cterm=bold
	hi FoldColumn              ctermfg=blue    ctermbg=black
	hi Folded                  ctermfg=black   ctermbg=white
	hi Function                ctermfg=yellow
	hi Identifier              ctermfg=yellow                  cterm=bold
	hi IncSearch               ctermfg=white   ctermbg=red     cterm=bold
	hi Keyword                 ctermfg=blue
	hi Label                   ctermfg=magenta
	hi LineNr                  ctermfg=black                   cterm=bold
	hi CursorLine              ctermfg=white   ctermbg=black   cterm=bold
	hi CursorLineNr            ctermfg=white   ctermbg=blue
	hi Macro                   ctermfg=yellow
	hi MatchParen              ctermfg=black   ctermbg=cyan    cterm=bold
	hi ModeMsg                 ctermfg=yellow                  cterm=bold
	hi MoreMsg                 ctermfg=cyan                    cterm=bold
	hi NonText                 ctermfg=black   ctermbg=none    cterm=bold
	hi Number                  ctermfg=green                   cterm=bold
	hi Operator                ctermfg=magenta                 cterm=bold
	hi PreCondit               ctermfg=cyan                    cterm=bold
	hi PreProc                 ctermfg=cyan                    cterm=bold
	hi Question                ctermfg=cyan                    cterm=bold
	hi Repeat                  ctermfg=cyan                    cterm=bold
	hi Search                  ctermfg=white   ctermbg=red     cterm=bold
	hi SpecialChar             ctermfg=magenta                 cterm=bold
	hi SpecialComment          ctermfg=black                   cterm=bold
	hi Special                 ctermfg=magenta                 cterm=bold
	hi SpecialKey              ctermfg=green                   cterm=bold
	hi Statement               ctermfg=blue
	hi StorageClass            ctermfg=blue
	hi String                  ctermfg=green
	hi Structure               ctermfg=cyan                    cterm=bold
	hi Tag                     ctermfg=magenta
	hi Title                   ctermfg=white
	hi Todo                    ctermfg=green   ctermbg=none
	hi Typedef                 ctermfg=blue
	hi Type                    ctermfg=magenta
	hi Underlined              ctermfg=white                   cterm=underline
	hi VertSplit               ctermfg=green   ctermbg=black   cterm=bold
	hi Visual                  ctermfg=white   ctermbg=black   cterm=bold
	hi VisualNOS               ctermfg=green   ctermbg=black   cterm=bold
	hi WarningMsg              ctermfg=red                     cterm=bold
	hi WildMenu                ctermfg=magenta ctermbg=black   cterm=bold

	" statusline
	hi StatusLine              ctermfg=white   ctermbg=black   cterm=bold
	hi StatusModFlag           ctermfg=red     ctermbg=black   cterm=bold
	hi StatusRO                ctermfg=magenta ctermbg=black   cterm=bold
	hi StatusHLP               ctermfg=green   ctermbg=black   cterm=bold
	hi StatusPRV               ctermfg=yellow  ctermbg=black   cterm=bold
	hi StatusFTP               ctermfg=blue    ctermbg=black   cterm=bold

	" spellchecking
	hi SpellLocal              ctermfg=black   ctermbg=cyan    cterm=bold,underline
	hi SpellBad                ctermfg=white   ctermbg=red     cterm=bold,underline
	hi SpellCap                ctermfg=black   ctermbg=blue    cterm=bold,underline
	hi SpellRare               ctermfg=black   ctermbg=magenta cterm=bold,underline

	" pmenu
	hi Pmenu                   ctermfg=white   ctermbg=black
	hi PmenuSel                ctermfg=none    ctermbg=black   cterm=bold
	hi PmenuSbar               ctermfg=black   ctermbg=white   cterm=bold

	" html
	hi htmlTag                 ctermfg=blue                    cterm=bold
	hi htmlEndTag              ctermfg=blue                    cterm=bold
	hi htmlTagName             ctermfg=yellow

	" xml
	hi xmlTag                  ctermfg=cyan
	hi xmlEndTag               ctermfg=cyan
	hi xmlTagName              ctermfg=yellow                  cterm=bold

	" perl
	hi perlStatement           ctermfg=magenta                 cterm=bold
	hi perlStatementStorage    ctermfg=red
	hi perlVarPlain            ctermfg=cyan
	hi perlVarPlain2           ctermfg=yellow                  cterm=bold

	" mini buffer explorer
	hi MBENormal               ctermfg=black                   cterm=bold
	hi MBEChanged              ctermfg=red
	hi MBEVisibleNormal        ctermfg=magenta
	hi MBEVisibleNormalActive  ctermfg=magenta                 cterm=bold
	hi MBEVisibleChanged       ctermfg=white
	hi MBEVisibleChangedActive ctermfg=red                     cterm=bold

	" rst
	hi rstEmphasis             ctermfg=white                   cterm=underline
	hi rstLiteralBlock         ctermfg=yellow
	hi rstInlineLiteral        ctermfg=yellow                  cterm=bold
	hi rstSections             ctermfg=red
	hi rstHyperlinkTarget      ctermfg=cyan
	hi rstStandaloneHyperlink  ctermfg=green                   cterm=bold
	hi rstInterpretedTextOrHyperlinkReference ctermfg=green    cterm=bold
	hi rstCitation             ctermfg=black                   cterm=bold
	hi rstQuotedLiteralBlock   ctermfg=yellow                  cterm=bold
	hi rstLineBlock            ctermfg=cyan

endif

"
" gui zone
"
hi Normal                  guifg=#F8F8F8 guibg=#090C19
hi Boolean                 guifg=#F47BDA
hi Character               guifg=#DBDDE4 guibg=#090C19 gui=none 
hi Comment                 guifg=#8C8B89               gui=none
hi Conditional             guifg=#3278AA
hi Constant                guifg=#FFAA3E
hi Cursor                  guifg=#090C19 guibg=#1AAA13
hi Debug                   guifg=#F47BDA
hi Define                  guifg=#FADD2D 
hi Delimiter               guifg=#8C8B89
hi DiffLine                guifg=#3A57D7
hi DiffOldLine             guifg=#BE1919
hi DiffOldFile             guifg=#BE1919
hi DiffNewFile             guifg=#1AAA13 
hi DiffAdded               guifg=#5DCE33
hi DiffRemoved             guifg=#BE1919
hi DiffChanged             guifg=#3278AA
hi Directory               guifg=#1AAA13
hi Error                   guifg=#DC2F32 guibg=#090C19
hi ErrorMsg                guifg=#DC2F32 guibg=#090C19
hi Exception               guifg=#F47BDA
hi Float                   guifg=#4DC5DC
hi FoldColumn              guifg=#4DC5DC guibg=#090C19
hi Folded                  guifg=#4DC5DC guibg=#222946
hi Function                guifg=#FFAA3E
hi Identifier              guifg=#FADD2D
hi IncSearch               guifg=#DBDDE4 guibg=#BE1919
hi Keyword                 guifg=#3A57D7               gui=none
hi Label                   guifg=#B40078
hi LineNr                  guifg=#8C8B89 
hi CursorLine              guifg=#DBDDE4 guibg=#222946 gui=bold
hi CursorLineNr            guifg=#DBDDE4 guibg=#3A57D7 

hi Macro                   guifg=#FFAA3E
hi ModeMsg                 guifg=#FADD2D
hi MoreMsg                 guifg=#4DC5DC
hi NonText                 guifg=#8C8B89
hi Number                  guifg=#5DCE33
hi Operator                guifg=#E671D3
hi PreCondit               guifg=#F47BDA
hi PreProc                 guifg=#4DC5DC
hi Question                guifg=#4DC5DC
hi Repeat                  guifg=#4DC5DC
hi Search                  guifg=#DBDDE4 guibg=#BE1919
hi SpecialChar             guifg=#F47BDA
hi SpecialComment          guifg=#8C8B89
hi Special                 guifg=#F47BDA
hi SpecialKey              guifg=#5DCE33
hi Statement               guifg=#3A57D7               gui=none
hi StorageClass            guifg=#3A57D7               gui=none
hi String                  guifg=#1AAA13
hi Structure               guifg=#5F87AF
hi Tag                     guifg=#B40078               gui=none
hi Title                   guifg=#AEAEAE
hi Todo                    guifg=#5DCE33 guibg=#1A1A1A
hi Typedef                 guifg=#3A57D7
hi Type                    guifg=#B40078               gui=none
hi Underlined              guifg=#AEAEAE guibg=#090C19
hi VertSplit               guifg=#222946 guibg=#FADD2D
hi Visual                  guifg=#DBDDE4 guibg=#8C8B89
hi VisualNOS               guifg=#5DCE33 guibg=#8C8B89
hi WarningMsg              guifg=#DC2F32 
hi WildMenu                guifg=#8787D7 guibg=#222946
hi CursorLine                            guibg=#222946 gui=none
	
" statusline
hi StatusLine              guifg=#AEAEAE guibg=#222946 gui=none
hi StatusLineNC            guifg=#222946 guibg=#AEAEAE
hi StatusModFlag           guifg=#DC2F32 guibg=#222946 gui=bold
hi StatusRO                guifg=#F47BDA guibg=#222946 gui=bold
hi StatusHLP               guifg=#5DCE33 guibg=#222946 gui=bold
hi StatusPRV               guifg=#FADD2D guibg=#222946 gui=bold
hi StatusFTP               guifg=#507CFF guibg=#222946 gui=bold

" spellchecking
hi SpellBad                guifg=#DBDDE4 guifg=#BE1919 gui=underline
hi SpellCap                guifg=#222946 guifg=#507CFF gui=underline
hi SpellRare               guifg=#222946 guifg=#F47BDA gui=underline
hi SpellLocal              guifg=#222946 guifg=#4DC5DC gui=underline

" pmenu
hi PMenu                   guifg=#AEAEAE guibg=#222956
hi PMenuSel                guifg=#222956 guibg=#8C8B89

" html
hi htmlTag                 guifg=#507CFF
hi htmlEndTag              guifg=#507CFF
hi htmlTagName             guifg=#FADD2D

" xml
hi xmlTag                  guifg=#3A57D7
hi xmlEndTag               guifg=#3A57D7
hi xmlTageName             guifg=#FFAA3E

" perl
hi perlStatement           guifg=#F47BDA
hi perlStatementStorage    guifg=#BE1919
hi perlVarPlain            guifg=#258F8F
hi perlVarPlain2           guifg=#FADD2D

" mini buffer explorer
hi MBENormal               guifg=#8C8B89
hi MBEChanged              guifg=#BE1919
hi MBEVisibleNormal        guifg=#B40078
hi MBEVisibleNormalActive  guifg=#F47BDA
hi MBEVisibleChanged       guifg=#AEAEAE
hi MBEVisibleChangedActive guifg=#DC2F32

" rst
hi rstEmphasis             guifg=#AEAEAE               gui=underline
hi rstLiteralBlock         guifg=#FFAA3E
hi rstInlineLiteral        guifg=#FADD2D
hi rstSections             guifg=#BE1919
hi rstHyperlinkTarget      guifg=#258F8F
hi rstStandaloneHyperlink  guifg=#5DCE33
hi rstInterpretedTextOrHyperlinkReference guifg=#5DCE33
hi rstCitation             guifg=#AEAEAE
hi rstQuotedLiteralBlock   guifg=#FADD2D
hi rstLineBlock            guifg=#258F8F

