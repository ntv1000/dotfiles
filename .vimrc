let mapleader = ","
execute pathogen#infect()
" show line number
set number
"set autoread
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
" relative line numbers
set relativenumber
" syntax highlightning
syntax on
" change comment color to lightblue for better readability
hi Comment ctermfg=lightblue
hi PreProc ctermfg=green
" disable auto-comment insertion
" add "cr" to disable it completely
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" python autocomplete plugin stuff
"let g:jedi#auto_initialization = 0
"let g:pydiction_location = '/home/christian/.vim/bundle/pydiction/complete-dict'
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope = 0 
set foldmethod=indent
set foldlevel=99
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
"let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview
autocmd FileType python setlocal completeopt-=preview
inoremap <C-j> <Down>
inoremap <C-k> <Up>
