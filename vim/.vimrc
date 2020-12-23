syntax on               "enable syntax highlighting

set spell               "enable spellcheck
set tags+=~/.gtags      "tags paths
set tags+=.tags

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
set printoptions+=number:y

set termguicolors       "full colors
set lazyredraw          "only redraw when necesarry

set hlsearch            "highlight searches
set incsearch           "incremental highlighting

set undofile            "persistent undo

set exrc                "dir-local vim configuration

filetype indent on      "load indent rules
filetype plugin on      "load plugin rules

let mapleader=' '       "spacebar as leader key

"don't use virtualenv
let python_host_prog='/usr/bin/python2'
let python3_host_prog='/usr/bin/python3'

"plug
call plug#begin('~/.vim/plugged')
"Plug 'Valloric/YouCompleteMe', {'for': 'c'}
"Plug 'rdnetto/YCM-Generator', {'for': 'c', 'branch': 'stable'}
Plug 'kchmck/vim-coffee-script'          "syn highlight - coffee
Plug 'rodjek/vim-puppet'                 "syn highlight - puppet
Plug 'vim-pandoc/vim-pandoc-syntax'      "syn highlight - markdown
Plug 'rust-lang/rust.vim'                "syn highlight - rust
Plug 'arrufat/vala.vim'                  "syn highlight - vala
Plug 'tpope/vim-fugitive'                "git integration
Plug 'airblade/vim-gitgutter'            "git chunk annotation
Plug 'airblade/vim-accent'               "accented character support
Plug 'tpope/vim-sleuth'                  "indent detection
Plug 'ntpeters/vim-better-whitespace'    "highlight trailing whitespace
Plug 'morhetz/gruvbox'                   "colorscheme
Plug 'w0rp/ale'                          "linter
Plug 'Shougo/deoplete.nvim'              "autocomplete
Plug 'artur-shaik/vim-javacomplete2'     "autocomplete for java
Plug 'zchee/deoplete-jedi'               "autocomplete for python
Plug 'racer-rust/vim-racer'              "autocomplete for rust
Plug 'sbdchd/neoformat'                  "formatter
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "markdown preview
Plug 'rhysd/rust-doc.vim'                "rust documentation
Plug 'vim-airline/vim-airline'           "status bar
Plug 'vim-airline/vim-airline-themes'    "status bar themes
Plug 'majutsushi/tagbar'                 "ctags pane browser
Plug 'ctrlpvim/ctrlp.vim'                "file/buffer searching
Plug 'jpalardy/vim-slime'                "slime repl
Plug 'tmhedberg/SimpylFold'              "python folding
Plug 'maxbrunsfeld/vim-yankstack'        "kill ring for vim
Plug 'kshenoy/vim-signature'             "display marks
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
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
set updatetime=250

"airline
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled = 1

"highlight tab characters
autocmd ColorScheme * highlight Tab ctermbg=228 guibg=#f2e5bc
autocmd Syntax,BufWinEnter * syn match Tab /\t\+/

colorscheme gruvbox
set background=light
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1

"ale
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)
let g:ale_linters = {
    \ 'rust': ['rls'],
    \ 'haskell': ['stack-ghc', 'hlint', 'hdevtools', 'hfmt'],
    \ }

"deoplete
let g:deoplete#enable_at_startup=1

"javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"jedi
let g:deoplete#sources#jedi#show_docstring=1

"rust-doc
let g:rust_doc#downloaded_rust_doc_dir='~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/doc'

"slime
let g:slime_target='tmux'
let g:slime_default_config={'socket_name': 'slime', 'target_pane': ':'}
"let g:slime_python_ipython=1

"ctrlp
set wildignore+=*.so,*.swp,*.zip,*.class,*.o,*.jar,*.ods,*.iml,*.pyc,.git/*,node_modules,dist,target

"tagbar
let g:tagbar_autopreview = 1
nnoremap <leader>t :TagbarToggle<CR>

"tags
let g:tags_cmd = 'ctags -f .tags -R .'
if filereadable('.tags')
    call jobstart(g:tags_cmd)
    autocmd BufWritePost * call jobstart(g:tags_cmd)
    autocmd VimEnter * nested :TagbarOpen
endif

"yankstack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

"signature
nnoremap m<Space> :SignatureToggleSigns<CR>

"center text
map <leader>c :center 80<cr>

"disable hl
nnoremap <leader><leader> :<C-u>nohlsearch<CR>

"case insensitive searches
nmap / /\c

"system clipboard integration
nmap <esc>p "+p
nmap <esc>y "+y

"quick saving/exiting
imap <F1> <esc>:w<Enter>i
imap <F2> <esc>:w<Enter>

map <F1> :w<cr>
map <F3> :wq<cr>
map <F4> :q!<cr>

"quick make
if filereadable('Makefile')
    map <F8> :!make<cr>
elseif filereadable('build.xml')
    map <F8> :!ant<cr>
elseif filereadable('Cargo.toml')
    map <F8> :!cargo build<cr>
endif
