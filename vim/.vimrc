syntax on

set spell
set tags+=~/.tags

set expandtab
set tabstop=4
set shiftwidth=4

set autoindent
set smartindent
set nocindent
set foldmethod=syntax

set tw=80
set colorcolumn=80
set number
set rnu
set termguicolors
set hlsearch
set breakindent

set clipboard+=unnamedplus

filetype on

let mapleader=' '

" plug
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', {'for': 'c'}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'
Plug 'rodjek/vim-puppet'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'morhetz/gruvbox'
Plug 'Valloric/vim-valloric-colorscheme'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jpalardy/vim-slime'
Plug 'tmhedberg/SimpylFold'
Plug 'roryokane/detectindent'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'Shougo/vinarise.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

"vim-pandoc-syntax
augroup pandoc_syntax
    au! BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
augroup END

"ycm
let g:ycm_autoclose_preview_window_after_insertion=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_add_preview_to_completeopt=1

"gitgutter
let g:gitgutter_enabled=1
"let g:gitgutter_highlight_lines=1
let g:gitgutter_realtime=1
let g:gitgutter_eager=1

"airline
let g:airline_powerline_fonts=1
"let g:airline_theme='hybrid'

"colorscheme valloric
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1

"neomake
autocmd! BufWritePost * Neomake

"deoplete
let g:deoplete#enable_at_startup=1

"rust-doc
let g:rust_doc#downloaded_rust_doc_dir='~/Code/rust/doc'

"slime
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "slime", "target_pane": ":"}
let g:slime_python_ipython=1

"detectindent
"augroup DetectIndent
"   autocmd!
"   autocmd BufReadPost *  DetectIndent
"augroup END

imap <F1> <esc>:w<Enter>i
imap <F2> <esc>:w<Enter>

map <F1> :w<cr>
map <F3> :wq<cr>
map <F4> :q!<cr>

map <F8> :!make<cr>
map <F9> :!make<cr><Enter>

filetype plugin indent on
