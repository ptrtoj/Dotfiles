" Defaults changed from Vim-8.0
"set nocompatible
"set nrformats-=octal  " increment as decimal, even with leading 0

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

set backspace     =indent,eol,start
set hidden
set laststatus    =2
set display       =lastline

set number
set relativenumber

set showmode
set showcmd
set wildmenu
set wildmode=full

set incsearch
set hlsearch    " ':noh' to turn off highlight

"set ttyfast    " Default on
set lazyredraw  " Default off

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

" Auto Commands
" Custom shift width & Auto insert comment character
autocmd FileType c set omnifunc=ccomplete#Complete formatoptions+=ro
autocmd FileType cpp set formatoptions+=ro
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType html,xhtml,css,xml,xslt set shiftwidth=2 softtabstop=2
autocmd FileType vim,lua set shiftwidth=2 softtabstop=2 

"colorscheme  zellner
