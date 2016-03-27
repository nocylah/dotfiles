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

filetype off

let mapleader=" "

" plug
call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'
Plug 'rodjek/vim-puppet'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'morhetz/gruvbox'
Plug 'Valloric/vim-valloric-colorscheme'
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jpalardy/vim-slime'
call plug#end()

"ycm
let g:ycm_autoclose_preview_window_after_insertion=1

"gitgutter
let g:gitgutter_enabled=1
"let g:gitgutter_highlight_lines = 1
let g:gitgutter_realtime=1
let g:gitgutter_eager=1

"airline
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'

"colorscheme valloric
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "code:1.2"}

imap <F1> <esc>:w<Enter>i
imap <F2> <esc>:w<Enter>

map <F1> :w<cr>
map <F3> :wq<cr>
map <F4> :q!<cr>

map <F8> :!make<cr>
map <F9> :!make<cr><Enter>

filetype plugin indent on
