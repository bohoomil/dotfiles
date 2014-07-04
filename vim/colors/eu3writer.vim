" euphrasia3 for DistractFree environment
" colour scheme for Vim
" Author:  bohoomil
" Date:    June, 2014
" Release: 1.0
"
" This theme is supposed to be used
" with the variation .Xdefaults colour settings.

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="eu3writer"

if &t_Co > 255
  hi Normal                  ctermfg=none
  hi Boolean                 ctermfg=13
  hi Character               ctermfg=15
  hi Comment                 ctermfg=8    ctermbg=none cterm=none
  hi Conditional             ctermfg=12
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
  hi Function                ctermfg=13
  hi Identifier              ctermfg=11                cterm=none
  hi IncSearch               ctermfg=15   ctermbg=1
  hi Keyword                 ctermfg=4
  hi Label                   ctermfg=5
  hi LineNr                  ctermfg=237
  hi CursorLine              ctermfg=15   ctermbg=0    cterm=bold
  hi CursorLineNr            ctermfg=15   ctermbg=4
  hi Macro                   ctermfg=3                 cterm=none
  hi MatchParen              ctermfg=0    ctermbg=14
  hi ModeMsg                 ctermfg=11
  hi MoreMsg                 ctermfg=14
  hi NonText                 ctermfg=0    ctermbg=none
  hi Number                  ctermfg=10
  hi Operator                ctermfg=13
  hi PreCondit               ctermfg=13   ctermbg=none cterm=none
  hi PreProc                 ctermfg=14
  hi Question                ctermfg=14
  hi Repeat                  ctermfg=14
  hi Search                  ctermfg=15   ctermbg=1
  hi SpecialChar             ctermfg=13
  hi SpecialComment          ctermfg=8
  hi Special                 ctermfg=5
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
  hi VendorPrefix            ctermfg=9
  hi VertSplit               ctermfg=0    ctermbg=none
  hi Visual                  ctermfg=15   ctermbg=8
  hi VisualNOS               ctermfg=10   ctermbg=8    cterm=bold
  hi WarningMsg              ctermfg=9
  hi WildMenu                ctermfg=0    ctermbg=11

  " statusline
  hi StatusLine              ctermfg=7    ctermbg=0    cterm=none
  hi StatusLineNC            ctermfg=0    ctermbg=7
  hi StatusModFlag           ctermfg=9    ctermbg=0    cterm=none
  hi StatusRO                ctermfg=13   ctermbg=0    cterm=none
  hi StatusHLP               ctermfg=10   ctermbg=0    cterm=none
  hi StatusPRV               ctermfg=11   ctermbg=0    cterm=none
  hi StatusFTP               ctermfg=6    ctermbg=0    cterm=none

  " spellchecking
  hi SpellLocal              ctermfg=0    ctermbg=5    cterm=none
  hi SpellBad                ctermfg=15   ctermbg=1    cterm=none
  hi SpellCap                ctermfg=0    ctermbg=12   cterm=none
  hi SpellRare               ctermfg=0    ctermbg=13   cterm=none

  " pmenu
  hi Pmenu                   ctermfg=7    ctermbg=0
  hi PmenuSel                ctermfg=none ctermbg=8
  hi PmenuSbar               ctermfg=8    ctermbg=15

  " css
  hi cssIdentifier           ctermfg=9
  hi cssClassName            ctermfg=14
  hi cssTagName              ctermfg=2
  hi cssPseudoClass          ctermfg=13
  hi cssMediaBlock           ctermfg=1

  " html
  hi htmlConstant            ctermfg=3
  hi htmlComment             ctermfg=8
  hi htmlTag                 ctermfg=12
  hi htmlEndTag              ctermfg=12
  hi htmlTagName             ctermfg=11
  hi htmlTitle               ctermfg=9
  hi htmlPreProc             ctermfg=14
  hi htmlBold                ctermfg=2   ctermbg=0    cterm=none
  hi htmlBoldUnderline       ctermfg=2   ctermbg=0    cterm=underline
  hi htmlBoldItalic          ctermfg=10  ctermbg=0    cterm=none
  hi htmlBoldUnderlineItalic ctermfg=10  ctermbg=0    cterm=underline
  hi htmlUnderline                                    cterm=underline
  hi htmlUnderlineItalic     ctermfg=12  ctermbg=none cterm=underline
  hi htmlItalic              ctermfg=12  ctermbg=none cterm=none
  hi htmlSpecial             ctermfg=66

  " mediawiki
  hi wikiParaFormatChar      ctermfg=10
  hi wikiLink                ctermfg=14

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

