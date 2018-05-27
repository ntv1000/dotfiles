let mapleader = ","
call plug#begin('~/.local/share/nvim/plugged')

" load plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bitc/vim-bad-whitespace'
Plug 'Shougo/denite.nvim'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'

Plug 'joshdick/onedark.vim'

call plug#end()

" themeing
colorscheme molokai
" set search highlight color to green
"autocmd ColorScheme * highlight search ctermbg=2 ctermfg=0
" set visual visual selection color
autocmd ColorScheme * highlight Visual ctermbg=240

" configure denite
" narrow by path in grep source
call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
" use ripgrep in grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-u', '-i'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" use interactive mode in grep source
"call denite#custom#source('grep', 'args', ['', '', '!'])

nmap <leader>d :Denite file/rec -default-action=tabswitch<CR>
nmap <leader>f :Denite grep -mode=normal -default-action=tabswitch<CR>
nmap <leader>c :DeniteCursorWord grep -mode=normal -default-action=tabswitch<CR>
call denite#custom#map(
	\ 'insert',
	\ '<C-j>',
	\ '<denite:move_to_next_line>',
	\ 'noremap'
	\)
call denite#custom#map(
	\ 'insert',
	\ '<C-k>',
	\ '<denite:move_to_previous_line>',
	\ 'noremap'
	\)

command TODO :Denite grep -mode=normal -auto-preview=true -default-action=tabswitch -input=TODO

" nerdcomment configuration
let g:NERDCreateDefaultMappings = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"map <leader>cc <plug>NERDCommenterToggle
map <leader>g <plug>NERDCommenterComment
map <leader>G <plug>NERDCommenterUncomment

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" enable deoplete on start-up
let g:deoplete#enable_at_startup = 1

" enable vimtex
let g:vimtex_enabled = 1
let g:vimtex_complete_enabled = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

nmap <F8> :TagbarToggle<CR>

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
set smartcase
" highlight search results
set hlsearch
" keep cursor in the middle
set scrolloff=9999
" search while typing
set incsearch
" for easier jump to mark
nmap ´ `
" for easier compilation
nmap <leader>m :make<CR>
" auto-complete with tab
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
imap <Tab> <C-R>=Tab_Or_Complete()<CR>
imap <S-Tab> <C-P>
" switch tabs easier
nmap <C-L> gt
nmap <C-H> gT
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
