" My Own Minimal Vimrc

" Actually, set by default when vim finds vimrc
set nocompatible

" Startup
filetype plugin indent on
syntax on

" Indentation
set ai 
set ts=4 sts=4 sw=4 
" Don't want my Tabs change to Shift Characters
"set et

" Whiteapces
set list
if has('multi_byte') && &encoding ==# 'utf-8'
	let &sbr='↪ '
	let &lcs='tab:→ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨'
endif

" Lines
set nu rnu cc=80 cul

" Commands
set ls=2  display=lastline
set smd sc

" Search
set is hls

" Window
set sb spr

" Redraw
set tf lz

" Theme
colo shine

