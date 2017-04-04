syntax on               "enable syntax highlighting

set spell               "enable spellcheck
set tags+=~/.tags       "tags path

set expandtab           "use spaces by default
set tabstop=4           "four spaces per tab
set shiftwidth=4        "indent width for autoindent

set autoindent          "copy indentation from current line
set nosmartindent       "no smart indentation
set nocindent           "no c-specific indentation
set foldmethod=syntax   "enable language-aware folding

set tw=80               "break text at 80 chars
set colorcolumn=80      "80 char reminder column
set breakindent         "break lines preserving indentation

set number              "line numbering
set rnu                 "relative line numbering

set termguicolors       "full colors
"set lazyredraw          "only redraw when necesarry

set hlsearch            "highlight searches
set incsearch           "incremental highlighting

set undofile            "persistent undo

filetype indent on      "load indent rules
filetype plugin on      "load plugin rules

let mapleader=' '

" plug
call plug#begin('~/.vim/plugged')
"Plug 'Valloric/YouCompleteMe', {'for': 'c'}
"Plug 'rdnetto/YCM-Generator', {'for': 'c', 'branch': 'stable'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
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
Plug 'maxbrunsfeld/vim-yankstack'
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
set background=light
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
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

"ctrlp
set wildignore+=*.so,*.swp,*.zip,*.class,*.o,*.d

"yankstack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

"disable hl
nnoremap <leader><leader> :<C-u>nohlsearch<CR>

"case insensitive searches
nmap / /\c

"make explicit system clipboard integration
nmap <esc>p "+p
nmap <esc>y "+y

imap <F1> <esc>:w<Enter>i
imap <F2> <esc>:w<Enter>

map <F1> :w<cr>
map <F3> :wq<cr>
map <F4> :q!<cr>

map <F8> :!make<cr>
map <F9> :!make<cr><Enter>
