" Define <leader>-key
let mapleader = ","

" Set internal encoding to UTF-8
set encoding=utf-8

" Show line numbers
set number

" Set tab width to 4
set tabstop=4
set shiftwidth=4
set encoding=utf-8

" Make searches case INsensitive with smartcase
set ignorecase
set smartcase

" Highlight search results
set hlsearch
" Search while typing
set incsearch

" Keep cursor in the middle of the screen
set scrolloff=9999

" Auto indent by analysing filetype
filetype plugin indent on

" Syntax highlightning
syntax on

" Enable manual folding
set foldmethod=manual

" Show cursorline
set cursorline

" Don't unload buffers when they become unactive
set hidden

" Mainly for gitgutter
set signcolumn=yes
set updatetime=100

" Avoid annoying 'q' characters after starting vim
" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=

" Use persistent undo-history.
if !isdirectory('/tmp/.vim-undo-dir')
	call mkdir('/tmp/.vim-undo-dir', '', 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

" Specify that relative paths in tagfiles are relative to the tagfile location
set tagrelative

" Save cursor position when switching buffer
set nostartofline
