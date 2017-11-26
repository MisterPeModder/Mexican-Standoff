" Remove compatiblity with Vi
set nocompatible
filetype off

" ==PLUGINS==
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins goes there.
Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on


" Add lines
set number

" Enable syntax highlighting
syntax on

" Cool colors
colorscheme slate

" Lightline color scheme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" == NERDTree ==

function! OpenNERDTree()
	NERDTree
	wincmd p
endfunction

augroup NERDTree_conf
	autocmd!
	autocmd VimEnter * call OpenNERDTree()
	" Open NERDTree on file opening
	"autocmd VimEnter * NERDTree
	" Go to previous (last accessed) window.
	"autocmd VimEnter * wincmd p
	"Close NERDTree if it is the last active buffer
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" The Gray Colomn of Death
set cc=80
highlight ColorColumn ctermbg=8
highlight Comment ctermfg=8

highlight LineNr ctermfg=8 ctermbg=0
highlight Visual ctermfg=7
highlight NonText ctermfg=8

" Enable mouse
set mouse=a

" ==MAPPINGS==

let mapleader = "-"

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

" Open .vimrc in a separate tab
nnoremap <leader>ev :tabedit<cr>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Save and quit
nnoremap <c-s> :w<cr>
nnoremap <c-q> :wq<cr>
nnoremap <leader><c-q> :q!<cr>

" Tab utils
nnoremap <tab><Up> :tabedit<cr>
nnoremap <tab><Right> :tabnext<cr>
nnoremap <tab><Left> :tabprevious<cr>
nnoremap <tab><Down> :q<cr>

" Duplicate line
inoremap <c-d> <esc>yypi
nnoremap <c-d> yyp

" Uppercase word
nnoremap <c-u> veU<esc>
inoremap <c-u> <esc>veU<esc>i

" alt + *
nnoremap ¨ veu<esc>

" Quoting
nnoremap <leader>" lbi"<esc>ea"<esc>
nnoremap <leader>' lbi'<esc>ea'<esc>
vnoremap <leader>" <esc>a"<esc>'<i"<esc>
vnoremap <leader>' <esc>a'<esc>'<i'<esc>

" Auto-indent .c & .h files
augroup autoIndent 
	autocmd!
	autocmd BufWritePre,BufRead *.[ch] :normal gg=G
augroup END

" Comment generation
nnoremap <leader>c 0i#<esc>0
augroup comments
	autocmd!
	autocmd BufRead *.[ch] nnoremap <buffer> <leader>c 0i/*<esc>$a*/<esc>0
	autocmd BufRead *.cpp nnoremap <buffer> <leader>c 0i//<esc>0
	autocmd BufRead *.vim|*.vimrc nnoremap <buffer> <leader>c 0i"<esc>0
augroup END

" Better tab completion
set wildmode=longest,list,full
set wildmenu

" == RUSH == 

" Pair creation
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
