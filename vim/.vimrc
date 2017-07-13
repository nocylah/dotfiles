syntax on               "enable syntax highlighting

set spell               "enable spellcheck
set tags+=~/.gtags       "tags paths
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

set termguicolors       "full colors
set lazyredraw          "only redraw when necesarry

set hlsearch            "highlight searches
set incsearch           "incremental highlighting

set undofile            "persistent undo

set exrc                "dir-local vim configuration

filetype indent on      "load indent rules
filetype plugin on      "load plugin rules

let mapleader=' '       "spacebar as leader key

"plug
call plug#begin('~/.vim/plugged')
"Plug 'Valloric/YouCompleteMe', {'for': 'c'}
"Plug 'rdnetto/YCM-Generator', {'for': 'c', 'branch': 'stable'}
Plug 'kchmck/vim-coffee-script'          "syn highlight - coffee
Plug 'rodjek/vim-puppet'                 "syn highlight - puppet
Plug 'vim-pandoc/vim-pandoc-syntax'      "syn highlight - markdown
Plug 'rust-lang/rust.vim'                "syn highlight - rust
Plug 'tpope/vim-fugitive'                "git integration
Plug 'airblade/vim-gitgutter'            "git chunk annotation
Plug 'tpope/vim-sleuth'                  "indent detection
Plug 'ntpeters/vim-better-whitespace'    "highlight trailing whitespace
Plug 'morhetz/gruvbox'                   "colorscheme
Plug 'benekastah/neomake'                "linter
Plug 'Shougo/deoplete.nvim'              "autocomplete
Plug 'artur-shaik/vim-javacomplete2'     "autocomplete for java
Plug 'zchee/deoplete-jedi'               "autocomplete for python
Plug 'sbdchd/neoformat'                  "formatter
Plug 'rhysd/rust-doc.vim'                "rust documentation
Plug 'vim-airline/vim-airline'           "status bar
Plug 'vim-airline/vim-airline-themes'    "status bar themes
Plug 'majutsushi/tagbar'                 "ctags pane browser
Plug 'ctrlpvim/ctrlp.vim'                "file/buffer searching
Plug 'jpalardy/vim-slime'                "slime repl
Plug 'tmhedberg/SimpylFold'              "python folding
Plug 'maxbrunsfeld/vim-yankstack'        "kill ring for vim
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

"highlight tab characters
autocmd ColorScheme * highlight Tab ctermbg=228 guibg=#f2e5bc
autocmd Syntax,BufWinEnter * syn match Tab /\t\+/

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

"javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

"jedi
let g:deoplete#sources#jedi#show_docstring=1

"rust-doc
let g:rust_doc#downloaded_rust_doc_dir='~/Code/rust/doc'

"slime
let g:slime_target='tmux'
let g:slime_default_config={'socket_name': 'slime', 'target_pane': ':'}
"let g:slime_python_ipython=1

"ctrlp
set wildignore+=*.so,*.swp,*.zip,*.class,*.o,*.d,*.jar,*.ods

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

if filereadable('Makefile')
    map <F8> :!make<cr>
elseif filereadable('build.xml')
    map <F8> :!ant<cr>
elseif filereadable('Cargo.toml')
    map <F8> :!cargo build<cr>
endif
