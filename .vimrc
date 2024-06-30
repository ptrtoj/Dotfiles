set nocompatible

" Enable filetype detection
filetype on
filetype plugin on
filetype indent on
syntax 	on

set autoindent
set expandtab
set softtabstop   =4
set shiftwidth    =4
set shiftround

" Custom shift width
" - Makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
" - Web
autocmd FileType html,xhtml,css,xml,xslt set shiftwidth=2 softtabstop=2
" - Vim, Lua
autocmd FileType vim,lua set shiftwidth=2 softtabstop=2 

set backspace     =indent,eol,start
set hidden
set laststatus    =2
set display       =lastline

set number
set relativenumber

set showmode
set showcmd

set incsearch
set hlsearch

set ttyfast
set lazyredraw

set splitbelow
set splitright

set cursorline
set colorcolumn   =80
set wrapscan
set report        =0
set synmaxcol     =200

set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set nobackup
"set backupdir   =$HOME/.vim/files/backup/
"set backupext   =-vimbackup
"set backupskip  =
"set directory   =$HOME/.vim/files/swap//
"set updatecount =100
"set undofile
"set undodir     =$HOME/.vim/files/undo/
"set viminfo     ='100,n$HOME/.vim/files/info/viminfo

"colorscheme  zellner

" Auto insert comment character
autocmd FileType c,cpp set formatoptions+=ro
autocmd FileType c set omnifunc=ccomplete#Complete
