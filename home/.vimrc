set nocompatible
"filetype plugin on
"let g:netrw_browse_split=2
let g:netrw_fastbrowse=2

source $VIM/vim74/vimrc_example.vim
source $VIM/vim74/mswin.vim
source $VIM/vim74/ftplugin/c.vim
behave mswin

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = ''
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  silent execute '\"!C:\
"endfunction

"source $VIM/vimfiles/colors/darkblue.vim

"=========using darkblue color scheme==========
"if has("gui_running")
"colorscheme darkblue 
"set gfn=Monospace\ 18
"else
"colorscheme peachpuff
"endif
"
"=====using solarized color scheme on both gui and terminal=======
set background=dark
" you can set to light also
" set background=light
colorscheme solarized

set grepprg=grep\ -nH
"set makeprg=gmake
set gfn=Monospace\ 14

set expandtab
set tabstop=4
set shiftwidth=4
set autowrite

set autoindent
set cindent
set backupdir=$HOME/tools/backup/

set foldmethod=indent
"set foldcolumn=2
"highlight FoldColumn guibg=lightyellow guifg=darkblue
"set tags=/workarea/wa_s30/j114liu/sb6/tags
"
" the following set used for resolve vim auto search tags problem
set tags=tags;
set autochdir

"set updatetime=800
"set previewheight=15
"au! CursorHold *.[ch] nested exe "silent! botright ptag " . expand("<cword>")
set number
set numberwidth=1
set ruler

" map the Ctrl-N to toggle cursorline on/off.
nnoremap <C-N> :setlocal cursorline!<CR>

" set taglist command
source $VIM/vim74/plugin/taglist.vim
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1

if has("cscope")
  set csprg=cscope
  set csto=0
  set cst
  set nocsverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set csverb
endif

"source ~/vimfiles/syntax/cocci.vim

if &term =~ "xterm"
  if has("terminfo")
    set t_Co=8
    set t_Sf=<Esc>[3%p1%dm
    set t_Sb=<Esc>[4%p1%dm
  else
    set t_Co=8
    set t_Sf=<Esc>[3%dm
    set t_Sb=<Esc>[4%dm
  endif
endif
"set mouse-=a
filetype plugin indent on
syntax on

" set git status bar in vim
function! MyStatusLine()
"if !GitBranch()
"return '%100.(File:%f 	Modify:%m 	ReadOnly:%r 	Buffer:%n 	%60.(Line:Col  %4.l:%-4.c%)%)'
"else
"return '*%-{GitBranch()} 	%100.(File:%f 	Modify:%m 	ReadOnly:%r 	Buffer:%n 	%60.(Line:Col  %4.l:%-4.c%)%)'
"endif
endfunction

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=%!MyStatusLine()
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"disable swap and backup files:*.swo, *.swp
set nobackup
set nowritebackup
set noswapfile

"hide toolbar or menus to see more text
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
setlocal spell spelllang=en_us
"set guioptions-=r  "remove right-hand scroll bar

" cscrope files attaching
"cs add ~/E-TRAC/cs.out
cs add /home/developer/Code/Git/Taipan/taipan-slave/cs.out
