syntax on

set spell

set expandtab
set tabstop=4
set shiftwidth=4

set autoindent
set smartindent
set nocindent

set tw=80
set colorcolumn=80
set number
set rnu

set hlsearch

set nocompatible
filetype off

let mapleader=" "

" plug
call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'
Plug 'rodjek/vim-puppet'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'morhetz/gruvbox'
Plug 'Valloric/vim-valloric-colorscheme'
Plug 'scrooloose/syntastic'
call plug#end()

"gitgutter
let g:gitgutter_enabled=1
"let g:gitgutter_highlight_lines = 1
let g:gitgutter_realtime=1
let g:gitgutter_eager=1

"powerline
"set rtp+=$HOME/.local/lib/python3.4/site-packages/powerline/bindings/vim/
"set laststatus=2
set t_Co=256
"let g:Powerline_symbols='fancy'

"colorscheme valloric
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='dark'

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

hi Normal ctermbg=none
hi NonText ctermbg=none

imap <F1> <esc>:w<Enter>i
imap <F2> <esc>:w<Enter>

map <F1> :w<cr>
map <F3> :wq<cr>
map <F4> :q!<cr>

map <F8> :!make<cr>
map <F9> :!make<cr><Enter>

filetype plugin indent on
