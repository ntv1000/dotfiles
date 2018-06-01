call plug#begin('~/.local/share/nvim/plugged')

Plug 'bitc/vim-bad-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/git-time-lapse'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'majutsushi/tagbar'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'

Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

Plug 'joshdick/onedark.vim'

call plug#end()



""""""""""
" Denite "
""""""""""

" Use ripgrep in grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-uu', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Enable narrowing by path in grep source
call denite#custom#source('grep', 'converters', ['converter/abbr_word'])

" Enable moving between lines while in insert mode
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


"""""""""""""""
" NERDcomment "
"""""""""""""""

" Disable default mappings
let g:NERDCreateDefaultMappings = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1


"""""""""""
" Airline "
"""""""""""

" Set theme
let g:airline_theme='molokai'

" Customize line section
let g:airline_section_z ='%p%%  %l:%c'

" Disable showing huks added/changed/removed
let g:airline#extensions#hunks#enabled = 0

" Disable branch icon
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''


""""""""""
" Vimtex "
""""""""""

" Enable Vimtex
let g:vimtex_enabled = 1

" Enable completion
let g:vimtex_complete_enabled = 1


""""""""""""
" Deoplete "
""""""""""""

" Enable deoplete on start-up
let g:deoplete#enable_at_startup = 1

" Integrate vimtex
if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete


"""""""""""""
" Signature "
"""""""""""""

" Remove mark from shada file when deleting it
let g:SignatureForceRemoveGlobal = 1

" Keybindings
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


"""""""""""""""
" Buffergator "
"""""""""""""""

" Disable default mappings
let g:buffergator_suppress_keymaps = 1

" Open buffergator on the right
let g:buffergator_viewport_split_policy = "R"

" Set size of vertical split
let g:buffergator_vsplit_size = 30

" Don't close buffergator when selecting an entry
let g:buffergator_autodismiss_on_select = 0

" Automatically update bufferlist
let g:buffergator_autoupdate = 1

" Use buffer name as list entry
let g:buffergator_display_regime = "bufname"

" Sort by buffer index (order of opening)
let g:buffergator_sort_regime = "bufnum"


""""""""""
" Tagbar "
""""""""""

" Automatically close tabbar when selecting an entry
let g:tagbar_autoclose = 1

" Automatically focus tagbar when opening
let g:tagbar_autofocus = 1

" Use order in file
let g:tagbar_sort = 0

"""""""""
" Mundo "
"""""""""

" Close mundo when selecting a graph node
let g:mundo_close_on_revert = 1

let g:gitgutter_sign_added              = '●'
let g:gitgutter_sign_modified           = '●'
let g:gitgutter_sign_removed            = '⨯'
let g:gitgutter_sign_removed_first_line = '⨯‾'
let g:gitgutter_sign_modified_removed   = '⨯●'
