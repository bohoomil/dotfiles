" vimrc by bohoomil
" vim:ft=vim:
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

filetype plugin on
filetype indent on

" --- pathogen "
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
let Vimplate = "/usr/bin/vimplate"

set nocompatible
set encoding=utf-8
set modeline
syntax on

" --- latex "
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "xelatex"
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_CompileRule_pdf = "xelatex -interaction=nonstopmode $*"
let g:Tex_ViewRule_pdf = "zathura >/dev/null 2>&1"
"let g:Tex_Menus = 1
"let g:Tex_MathMenus = 1

" --- ui "

"set t_Co=256
colorscheme euphrasia

set tw=0 
set wrap
set linebreak
set display+=lastline

set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

" --- buftabs
noremap <F3> :bprev<CR>
noremap <F4> :bnext<CR>
let g:buftabs_only_basename=1
let g:buftabs_separator = "."
let g:buftabs_marker_start = "["
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = "*"

" --- statusline
set cmdheight=1     " command line height
set laststatus=2    " condition to show status line, 2=always.
set ruler           " show cursor position in status line
set showmode        " show mode in status line
set showcmd         " show partial commands in status line
" fileformat, encoding, type, buffer num, RO/HELP/PREVIEW, mod flag, filepath; spacer;  line pos, line/total, percentage
set statusline=%{&ff}\ \%{&fenc}\ \b%1.3n\ \%#StatusFTP#\%Y\ \%#StatusRO#\%R\ \%#StatusHLP#\%H\ \%#StatusPRV#\%W\ \%#StatusModFlag#\%M\ \%#StatusLine#\%f\%=\%1.7c\ \%1.7l/%L\ \%p%%

" --- NERDTree config
nmap <silent> <F9> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=0
let NERDTreeDirArrows=0

" --- folding "
set foldmethod=marker
set foldnestmax=10      "deepest fold is 10 levels
set foldcolumn=1
"set nofoldenable        "dont fold by default
set foldlevel=0         "this is just what i use

" --- filetypes "
" txt2tags
au BufNewFile,BufRead *.t2t set ft=txt2tags
au Filetype txt2tags source $HOME/.vim/syntax/txt2tags.vim
au BufNewFile,BufRead *.t2t set wrap
au BufNewFile,BufRead *.t2t set lbr

" rst -- type :RP (ReST Preview) to preview
let project1 = { 'path': '~/documents/0_notes/0-tmp',}
let g:riv_projects = [project1]
let g:riv_fold_blank = 1
let g:riv_fold_level = 0

" Gentoo-specific settings for ebuilds.  These are the federally-mandated
" required tab settings.  See the following for more information:
" http://www.gentoo.org/proj/en/devrel/handbook/handbook.xml
" Better to emerge app-vim/gentoo-syntax, which provides full syntax,
" filetype and indent settings for all things Gentoo.
au BufWritePost,BufRead * if getline(1) =~ "^#!/bin/bash$" | set filetype=sh | endif
au BufRead,BufNewFile *.e{build,class} set ts=4 sw=4 noexpandtab
au BufRead,BufNewFile *.zsh-theme set filetype=zsh
au BufRead,BufNewFile Pkgfile set filetype=sh
au BufRead,BufNewFile PKGBUILD set filetype=sh

" --- tmux
let tmux = "/usr/share/vim/vim73/syntax/tmux.vim"
au BufRead,BufNewFile .tmux.conf set filetype=tmux.conf
au Syntax newlang source /usr/share/vim/vim73/syntax/tmux.vim

" --- logs
au BufNewFile,BufRead .log{.*} set ft=messages

" --- Syntax highlighting for subtitle files 
au BufNewFile,BufRead *.srt setf srt
au BufNewFile,BufRead *.mpsub setf mpsub
au BufNewFile,BufRead *.sub setf sub

au BufNewFile,BufRead Trolltech.conf,.mpdasrc,.xchm,.*toprc setf cfg
au BufRead *.txt set tw=80 " limit width to n cols for txt files
au BufRead *.eml set tw=0 fo=cq wm=0 " no auto wrapping, rewrapping will wrap to 80
au BufRead ~/.mutt/temp/mutt-* set tw=80 ft=mail " nocindent spell width, mail syntax hilight, spellcheck
au FileType tex set tw=80   " wrap at 80 chars for LaTeX files
au BufRead ~/.config/dwb/settings set ft=cfg

" --- other file types
autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif

" automatically give executable permissions if file 
" begins with #! and contains '/bin/' in the path
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent execute "!chmod a+x <afile>" | endif | endif

augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

" --- html conversion (:help 2html.vim)
let g:html_use_css = 1
let g:use_xhtml = 1
let g:html_use_encoding = "utf8"
let g:html_number_lines = 1

" --- keyboard "
" map keys to toggle functions
function! MapToggle(key, opt)
	let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
	exec 'nnoremap '.a:key.' '.cmd
	exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command! -nargs=+ MapToggle call MapToggle(<f-args>)

" --- semicolon enters ex mode
map ; :

" --- folding
map <C-m> <C-M>
map <C-r> <C-R>

" --- space bar un-highligts search
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" --- keys & functions
MapToggle <F5> spell
MapToggle <F6> hlsearch

" --- set noexpandtab
set expandtab
set noautoindent     " set noautoindent to prevent vim from
                     " inserting unwanted indents when pasting
set tabstop=2        " set tab keys to 2 spaces
set shiftwidth=2
set nu!              " line numbering
set smartindent
set bs=2             " backspace

" --- tab key in visual mode
vmap <tab> >gv
vmap <S-tab> <gv

" --- leader
let mapleader = ","
let g:BASH_MapLeader  = '.'
nnoremap <Leader>c :set cursorline!<CR>

" --- urxvt home / end
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

" --- mouse
if has('mouse')
	set mouse=a
endif
set mousemodel=popup_setpos

" --- improves redrawing for newer computers
set tf
set nolazyredraw        " turn off lazy redraw
set nohlsearch          " highlight no search results
set wildmenu
set spelllang=pl,en     " set spelling lang
set clipboard=unnamed   " yank and copy to X clipboard

" --- searching & history
set hlsearch          " highlight all search results
set incsearch         " increment search
set ignorecase        " case-insensitive search; opposite noignorecase
set smartcase         " uppercase causes case-sensitive search
set wrapscan          " searches wrap back to the top of file

set nobackup          " don't create backup files
set noswapfile        " don't create swap file

set history=50        " keep 50 lines of command line history
set incsearch         " do incremental searching

" --- FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set lcs=tab:▸\ ,eol:☠,trail:~,extends:>,precedes:<
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    "set nu!
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
    "hi clear NonText 
    "hi link NonText Ignore 
    "au ColorScheme * hi clear NonText | hi link NonText Ignore
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    "execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F12> :call ToggleFocusMode()<cr>

" --- misc
" allows writing to files with root priviledges
cmap w!! w !sudo tee % > /dev/null

" --- Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" --- gvim specific settings "
if has ("gui_running")
	" only initialize window size if it has not been initialized yet
	if !exists ("s:my_windowInitialized_variable")
		let s:my_windowInitialized_variable=1
	
	" --- feel free to :set background=light for a different style
	"set guicursor=a:blinkon0
	set background=dark

	set guifont=Luxi\ Mono\ 10

	" --- geometry
	set lines=70 columns=120

	set winaltkeys=no

	" --- menubar / toolbar on / off
	"map <silent> <F2> :if &guioptions =~# 'T' <Bar>
	"\set guioptions-=T <Bar>
	"\set guioptions-=m <bar>
	"\else <Bar>
	"\set guioptions+=T <Bar>
	"\set guioptions+=m <Bar>
	"\endif<CR>
	" --- turn off toolbar
	"set guioptions+=T
	"set guioptions-=T
	
	" remove scrollbars in gVim
	set guioptions+=LlRrb
	set guioptions-=LlRrb


	" toolbar -- exclusions
	aunmenu ToolBar.Make
	aunmenu ToolBar.RunCtags
	aunmenu ToolBar.SaveSesn
	aunmenu ToolBar.LoadSesn
	aunmenu ToolBar.SaveAll
	aunmenu ToolBar.FindHelp

	endif
endif

