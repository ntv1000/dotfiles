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
Plug 'jeetsukumaran/vim-buffergator'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/git-time-lapse'
Plug 'rust-lang/rust.vim'

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
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-uu', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" use interactive mode in grep source
"call denite#custom#source('grep', 'args', ['', '', '!'])

nmap <leader>f :w<CR>:Denite file/rec -smartcase -immediately-1<CR>
nmap <leader>g :w<CR>:Denite grep -no-empty -mode=normal -smartcase -immediately-1<CR>
nmap <M-*> :w<CR>:DeniteCursorWord grep -no-empty -mode=normal -smartcase -immediately-1<CR>
nmap <leader>t :w<CR>:DeniteCursorWord tag -no-empty -mode=normal -smartcase -immediately-1<CR>

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

command! TODO :w | Denite grep -mode=normal -auto-preview=true -default-action=switch -input=TODO

" nerdcomment configuration
let g:NERDCreateDefaultMappings = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
"map <leader>cc <plug>NERDCommenterToggle
map <leader>d <plug>NERDCommenterComment
map <leader>D <plug>NERDCommenterUncomment

" airline configuration
let g:airline_theme='molokai'
let g:airline_section_z ='%l:%c  %p%%'
let g:airline#extensions#hunks#enabled = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''

" enable deoplete on start-up
let g:deoplete#enable_at_startup = 1

" enable vimtex
let g:vimtex_enabled = 1
let g:vimtex_complete_enabled = 1
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete


function! ToggleTagbar()
	:BuffergatorClose
	:TagbarToggle
	:BuffergatorOpen
	:wincmd p
endfunction
nmap <F8> :call ToggleTagbar()<CR>

" git gutter configuration
set signcolumn=yes
set updatetime=100

command! -nargs=* Gc :Gcommit --verbose <args>
command! Gadd silent exec "!git add %"
command! Greset silent exec "!git reset"

" signature configuration
let g:SignatureForceRemoveGlobal = 1
let g:SignatureMap = {
	\ 'Leader'             :  "m",
	\ 'PlaceNextMark'      :  "m,",
	\ 'ToggleMarkAtLine'   :  "m.",
	\ 'PurgeMarksAtLine'   :  "m-",
	\ 'DeleteMark'         :  "dm",
	\ 'PurgeMarks'         :  "m<Space>",
	\ 'PurgeMarkers'       :  "m<BS>",
	\ 'GotoNextLineAlpha'  :  "']",
	\ 'GotoPrevLineAlpha'  :  "'[",
	\ 'GotoNextSpotAlpha'  :  "mn",
	\ 'GotoPrevSpotAlpha'  :  "mN",
	\ 'GotoNextLineByPos'  :  "]'",
	\ 'GotoPrevLineByPos'  :  "['",
	\ 'GotoNextSpotByPos'  :  "]`",
	\ 'GotoPrevSpotByPos'  :  "[`",
	\ 'GotoNextMarker'     :  "]-",
	\ 'GotoPrevMarker'     :  "[-",
	\ 'GotoNextMarkerAny'  :  "]=",
	\ 'GotoPrevMarkerAny'  :  "[=",
	\ 'ListBufferMarks'    :  "m/",
	\ 'ListBufferMarkers'  :  "m?"
	\ }

" buffergator configuration
function! BuffergatorIsOpen()
	return bufname("[[buffergator-buffers]]") == "[[buffergator-buffers]]"
endfunction

function! BuffergatorIsActive()
	return bufname("%") == "[[buffergator-buffers]]"
endfunction

autocmd vimenter * BuffergatorOpen " automatically open buffergator on startup
autocmd vimenter * if (BuffergatorIsActive()) | wincmd p | endif " unfocus buffergator window if it is focused at startup
autocmd bufenter * if (winnr("$") == 1 && BuffergatorIsOpen()) | q | endif " automatically close buffergator if it is the last remaining window
let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = "R"
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_autoupdate = 1
let g:buffergator_vsplit_size = 30
let g:buffergator_sort_regime = "bufnum"
let g:buffergator_display_regime = "bufname"
nmap <leader>b :BuffergatorToggle<CR>

nmap <C-j> :bnext<CR>
nmap <C-k> :bprev<CR>
nmap # :e #<CR>
nmap <Space> :silent exec "! aplay ~/dotfiles/laser.wav > /tmp/output 2>&1 &"<CR>

xnoremap <Tab> >
xnoremap <S-Tab> <

nnoremap <C-M-O> :nohlsearch<CR>
imap <M-CR> <Esc>:wq<CR>
nnoremap x "_x

function! OpenTimeLapse()
	:BuffergatorClose
	:call TimeLapse()
	:tabprevious
	:BuffergatorOpen
	:wincmd p
	:tabnext
endfunction
command! Ghist :call OpenTimeLapse()

" tagbar configuration
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

" set internal encoding to UTF-8
set encoding=utf-8
" show line number
set number
" set tab width
set tabstop=4
set shiftwidth=4
" make searches case INsensitive
set ignorecase
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

function! OpenSplitTerm(cmd)
	belowright split
	resize 15
	execute "terminal bash -c \"" . a:cmd . " ; bash\""
endfunction
nmap <leader>x :call OpenSplitTerm("cargo run")<CR>
tnoremap <Esc> <C-\><C-n>
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
" switch buffers easier
nmap <C-L> :bnext<CR>
nmap <C-H> :bprevious<CR>

function! CloseBuffer()
	:BuffergatorClose
	:bdelete
	:BuffergatorOpen
	:wincmd p
endfunction
nmap <Backspace> :call CloseBuffer()<CR>
nmap <M-Backspace> :tabclose<CR>
nmap <CR> :w<CR>
nmap <M-CR> :wq<CR>
" easiert window switchting
function! CloseIfNotLastWindow()
	if (winnr("$") == 1 || (winnr("$") == 2 && BuffergatorIsOpen()))
		echo "last window - not closing"
	else
		quit
	endif
endfunction
nmap <Esc> :call CloseIfNotLastWindow()<CR>
nmap <M-h> :wincmd h<CR>
nmap <M-l> :wincmd l<CR>
nmap <M-k> :wincmd k<CR>
nmap <M-j> :wincmd j<CR>
" shortcut to reload all buffers
function! ReloadBuffers()
	:bufdo e
	:syntax on
endfunction
nmap <F5> :call ReloadBuffers()<CR>
" shortcut to relead vimrc
nmap <leader>r :source $MYVIMRC<CR>
" auto indent by analysing filetype
filetype on
filetype indent plugin on
" syntax highlightning
syntax on
" disable auto-comment-insertion (add "cr" to disable it completely)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
set foldmethod=manual

set cursorline
