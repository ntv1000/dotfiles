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

" nerdcomment configuration
let g:NERDCreateDefaultMappings = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

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

let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = "R"
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_autoupdate = 1
let g:buffergator_vsplit_size = 30
let g:buffergator_sort_regime = "bufnum"
let g:buffergator_display_regime = "bufname"

" tagbar configuration
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
