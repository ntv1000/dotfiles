let mapleader = ","
call plug#begin('~/.local/share/nvim/plugged')

" load plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'bitc/vim-bad-whitespace'

call plug#end()

" themeing
colorscheme molokai
" set search highlight color to green
"autocmd ColorScheme * highlight search ctermbg=2 ctermfg=0
" set visual visual selection color
autocmd ColorScheme * highlight Visual ctermbg=240

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" git gutter configuration
set signcolumn=yes
set updatetime=100

" set internal encoding to UTF-8
set encoding=utf-8
" show line number
set number
" set tab width
set tabstop=4
set shiftwidth=4
" make searches case INsensitive
set ignorecase
" highlight search results
set hlsearch
" keep cursor in the middle
set scrolloff=9999
" search while typing
set incsearch
" for easier jump to mark
map ´ `
" auto indent by analysing filetype
filetype on
filetype indent plugin on
" syntax highlightning
syntax on
" disable auto-comment-insertion (add "cr" to disable it completely)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
set foldmethod=manual
"map <leader>td <Plug>TaskList
"map <leader>g :GundoToggle<CR>
