" vimrc by bohoomil
" vim:ft=vim:

" ### PATHOGEN {{{
execute pathogen#infect()
call pathogen#helptags()
call pathogen#incubate()
filetype plugin indent on
let Vimplate = "/usr/bin/vimplate"
source ~/.vim/bash-support/rc/customization.vimrc
"}}}

" ### BASE SETTINGS {{{
"set t_Co=256
colorscheme euphrasia

set nocompatible
set encoding=utf-8
set modeline
syntax on

set tw=0 
set wrap
set linebreak
set display+=lastline

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

" listchars
" de|activate: :set no|list
set listchars=trail:·,precedes:«,extends:»,eol:┘,tab:▸\
"}}}

" ### LATEX {{{
map <C-v> :!latexmk -quiet -xelatex -pvc -new-viewer- -view=pdf % > /dev/null 2>&1 &<cr><cr>
"}}}

" ### BUFTABS {{{
noremap <F3> :bprev<CR>
noremap <F4> :bnext<CR>
let g:buftabs_only_basename=1
let g:buftabs_separator = "."
let g:buftabs_marker_start = "["
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = "*"
"}}}

" ###  STATUS LINE {{{
set cmdheight=1     " command line height
set laststatus=2    " condition to show status line, 2=always.
set ruler           " show cursor position in status line
set showmode        " show mode in status line
set showcmd         " show partial commands in status line
" fileformat, encoding, type, buffer num, RO/HELP/PREVIEW, mod flag, filepath; spacer;  line pos, line/total, percentage
set statusline=\%{&ff}\ \%{&fenc}\ \b%1.3n\ \%#StatusFTP#\%Y\ \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%M\ \%#StatusLine#\%f\%=\%1.7c\ \%1.7l/%L\ \%p%%
"}}}

" ### NERDTree {{{
nmap <silent> <F9> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=0
"let NERDChristmasTree=1
"let NERDTreeAutoCenter=0
"let NERDTreeShowLineNumbers=1
"let NERDTreeWinSize=40
"let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
"}}}

" ### FOLDING -- GENERAL {{{
set foldmethod=marker   "syntax
set foldnestmax=10      "deepest fold is 10 levels
set foldcolumn=1
"set nofoldenable        "dont fold by default
set foldlevel=0         "this is just what i use
"}}}

" ### FILETYPES {{{
" -- txt2tags {{{
au Filetype txt2tags source $HOME/.vim/syntax/txt2tags.vim
"au BufNewFile,BufRead *.t2t set ft=txt2tags,wrap,br "spell
"au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
"}}}

" -- restructeredText {{{
" rst -- type :RP (ReST Preview) to preview
":com RP :exec "Vst html" | w! /tmp/test.html | :q | !firefox /tmp/test.html
" riv configuration
let project1 = { 'path': '/mnt/sda3/documents/0_notes/0-tmp',}
let g:riv_projects = [project1]
let g:riv_auto_fold_force = 1
let g:riv_fold_blank = 1
let g:riv_fold_level = 2
"let g:riv_auto_fold1_lines = 1
"let g:riv_auto_fold2_lines = 1
au BufRead,BufNewFile *.rest set filetype=rst
au filetype rst set tw=80
"}}}

" -- Markdown {{{
augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END
syntax region markdownFold start="^\z(#\+\) " end="\(^#\(\z1#*\)\@!#*[^#]\)\@=" transparent fold
autocmd FileType markdown set foldmethod=syntax
"}}}

" -- Asciidoc {{{
au BufRead,BufNewFile *.asc,*.asciidoc set tw=80 ft=asciidoc
"}}}

" -- Gentoo ebuilds {{{
" Gentoo-specific settings for ebuilds.  These are the federally-mandated
" required tab settings.  See the following for more information:
" http://www.gentoo.org/proj/en/devrel/handbook/handbook.xml
" Better to emerge app-vim/gentoo-syntax, which provides full syntax,
" filetype and indent settings for all things Gentoo.
"au BufRead,BufNewFile *.e{build,class} let is_bash=1|setfiletype sh
au BufWritePost,BufRead * if getline(1) =~ "^#!/bin/bash$" | set filetype=sh | endif
au BufRead,BufNewFile *.e{build,class} set ts=4 sw=4 noexpandtab
au BufRead,BufNewFile *.zsh-theme set filetype=zsh
au BufRead,BufNewFile Pkgfile set filetype=sh
au BufRead,BufNewFile PKGBUILD set filetype=sh
au BufRead,BufNewFile README set tw=80
"}}}

" -- tmux {{{
let tmux = "/usr/share/vim/vim73/syntax/tmux.vim"
au BufRead,BufNewFile .tmux.conf set filetype=tmux.conf
au Syntax newlang source /usr/share/vim/vim73/syntax/tmux.vim
"}}}

" -- logs {{{
au BufNewFile,BufRead .log{.*} set ft=messages
"}}}

" -- Movie subtitles {{{
au BufNewFile,BufRead *.srt setf srt
au BufNewFile,BufRead *.mpsub setf mpsub
au BufNewFile,BufRead *.sub setf sub
"}}}

" -- Misc file types {{{
autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif
au BufNewFile,BufRead Trolltech.conf,.mpdasrc,.xchm,.*toprc setf cfg
au BufRead *.txt set tw=80 " limit width to n cols for txt files
"autocmd FileType eml set tw=80  " limit width to n cols for email files
au BufRead *.eml set tw=0 fo=cq wm=0 " no automatic wrapping, rewrapping will wrap to 80
au BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail " nocindent spell   " width, mail syntax hilight, spellcheck
au FileType tex set tw=80   " wrap at 80 chars for LaTeX files
au BufRead ~/.config/dwb/settings set ft=cfg
au BufRead /tmp/mutt*      :source ~/.vim/mail
"}}}

" -- Scripts {{{
" automatically give executable permissions if file 
" begins with #! and contains '/bin/' in the path
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif
"}}}

" -- OpenSSL encryption {{{
autocmd BufReadPost,FileReadPost   creds.aes set foldexpr=HeadlineDelimiterExpression(v:lnum)
autocmd BufReadPost,FileReadPost   creds.aes set foldlevel=0
autocmd BufReadPost,FileReadPost   creds.aes set foldcolumn=0
autocmd BufReadPost,FileReadPost   creds.aes set foldmethod=expr
autocmd BufReadPost,FileReadPost   creds.aes set foldtext=getline(v:foldstart)
autocmd BufReadPost,FileReadPost   creds.aes nnoremap <silent><space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<CR>
autocmd BufReadPost,FileReadPost   creds.aes highlight Folded ctermbg=88 ctermfg=250
"}}}

" -- XML {{{
let g:xml_syntax_folding=1
au FileType xml set foldlevel=1
au FileType xml set foldnestmax=2
"au FileType xml set foldcolumn=1
au FileType xml set foldmethod=syntax
"}}}

" -- HTML conversion (:help 2html.vim) {{{
let g:html_use_css = 1
let g:use_xhtml = 1
let g:html_use_encoding = "utf8"
let g:html_number_lines = 1
"}}}
"}}}

" ### KEYBOARD & MOUSE {{{
" -- Map keys to toggle functions {{{
function! MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)
"}}}

" -- Semicolon enters ex mode {{{
map ; :
"}}}

" -- folding {{{
map <C-m> <C-M>
map <C-r> <C-R>
"}}}

" -- Space bar un-highligts search {{{
noremap <silent> <Space> :silent noh<Bar>echo<CR>
"}}}

" --- Keys & functions {{{
MapToggle <F5> spell
MapToggle <F6> hlsearch
"}}}

" -- Set noexpandtab {{{
set tabstop=2        " set tab keys to 2 spaces
set shiftwidth=2
set expandtab
set nu!              " line numbering
set smartindent
set bs=2             " backspace
set noautoindent     " set noautoindent to prevent vim from
                     " inserting unwanted indents when pasting
"}}}

" -- tab key in visual mode {{{
vmap <tab> >gv
vmap <S-tab> <gv
"}}}

" -- leader {{{
let mapleader = ","
let g:BASH_MapLeader  = '.'
nnoremap <Leader>c :set cursorline!<CR>
"}}}

" -- urxvt home / end {{{
" the second is for insert mode
map  <Esc>[7~ <Home>
map  <Esc>[8~ <End>
imap <Esc>[7~ <Home>
imap <Esc>[8~ <End>
"set nolist  " list disables linebreak
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
nmap <silent> k gk
nmap <silent> j gj
"}}}

" -- Mouse {{{
if has('mouse')
  set mouse=a
endif
set mousemodel=popup_setpos
"}}}
"}}}

" ### SEARCHING & HISTORY {{{
set hlsearch          " highlight all search results
"set nohlsearch          " highlight no search results
set incsearch         " increment search
set ignorecase        " case-insensitive search; opposite noignorecase
set smartcase         " uppercase causes case-sensitive search
set wrapscan          " searches wrap back to the top of file

set nobackup          " don't create backup files
set noswapfile        " don't create swap file

set history=50        " keep 50 lines of command line history
set incsearch         " do incremental searching
"}}}

" ### MISC SETTINGS {{{
" -- Allow writing to files with root priviledges {{{
cmap w!! w !sudo tee % > /dev/null
"}}}

" -- improves redrawing for newer computers {{{
set tf
set nolazyredraw        " turn off lazy redraw
set wildmenu
set spelllang=en        " set spelling lang
set clipboard=unnamed   " yank and copy to X clipboard
"}}}

" -- Show syntax highlighting groups for word under cursor {{{
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
"}}}
