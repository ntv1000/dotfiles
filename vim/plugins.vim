call plug#begin('~/.local/share/nvim/plugged')

Plug 'bitc/vim-bad-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/git-time-lapse'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-startify'

Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'OmniSharp/omnisharp-vim'

Plug 'joshdick/onedark.vim'

call plug#end()



""""""""""
" Denite "
""""""""""

" Settings for denite buffer
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	" Define key-mappings
	nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
	nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> <ESC> denite#do_map('quit')
	nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'

	" Store windows-ID of filter window (used for DeniteMoveCursor())
	let g:denite_win_id = win_getid()
endfunction

" Settings for filter buffer
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	" Close filter buffer directly from insert mode
	imap <silent><buffer> <Esc> <Plug>(denite_filter_quit)

	" Do action directly from insert mode
	imap <silent><buffer> <CR> <Plug>(denite_filter_quit)<CR>

	" Disable autocompletion when filtering
	call deoplete#custom#buffer_option('auto_complete', v:false)

	" Add binding for going up/down while in insert mode
	inoremap <silent><buffer> <C-j> <ESC>:call DeniteMoveCursor(1)<CR>A
	inoremap <silent><buffer> <C-k> <ESC>:call DeniteMoveCursor(-1)<CR>A
endfunction

" Use ripgrep in grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '-uu', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Enable narrowing by path in grep source
call denite#custom#source('grep', 'converters', ['converter/abbr_word'])


"""""""""""""""""
" NERDcommenter "
"""""""""""""""""

" Disable default mappings
let g:NERDCreateDefaultMappings = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Use single line comments in C files.
let g:NERDAltDelims_c = 1


"""""""""""
" Airline "
"""""""""""

" Set theme
let g:airline_theme='onedark'

" Customize line section
let g:airline_section_z ='%p%%  %l:%c'

" Disable showing huks added/changed/removed
let g:airline#extensions#hunks#enabled = 0

" Disable branch icon
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''


" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" Set minimal separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Show buffers in tabline
let g:airline#extensions#tabline#show_buffers = 1

" Don't show tabs in tabline
let g:airline#extensions#tabline#show_tabs = 0

" Set custom overflow marker
let g:airline#extensions#tabline#overflow_marker = '…'

" Show directories of a file if there are multiple files with the same name
" Alternative uniqueness algorithm: 'unique_tail_improved'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Don't show the close button
let g:airline#extensions#tabline#show_close_button = 0

" Don't show buffers label
let g:airline#extensions#tabline#buffers_label = ''


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

call deoplete#custom#option('sources', {
		\ 'cs': ['omnisharp'],
		\})


"""""""""""""
" Signature "
"""""""""""""

" Remove mark from shada file when deleting it
let g:SignatureForceRemoveGlobal = 1

" Dynamically color marks according to git gutter status
let g:SignatureMarkerTextHLDynamic = 1

" Dynamically color markers according to git gutter status
let g:SignatureMarkTextHLDynamic = 1

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


"""""""""
" Mundo "
"""""""""

" Close mundo when selecting a graph node
let g:mundo_close_on_revert = 1


"""""""""""""
" Gitgutter "
"""""""""""""

" Set custom signs
let g:gitgutter_sign_added              = '●'
let g:gitgutter_sign_modified           = '●'
let g:gitgutter_sign_removed            = '✖'
let g:gitgutter_sign_removed_first_line = '✖‾'
let g:gitgutter_sign_modified_removed   = '●_'


"""""""
" ALE "
"""""""

" Enable OmniSharp linter
let g:ale_linters = {
\	'cs': ['OmniSharp'],
\	'python': ['flake8'],
\	'cpp': ['clangd']
\}

" Read compile commands from compile_commands.json
let g:ale_c_parse_compile_commands = 1

"let g:ale_sign_error = '✖'
"let g:ale_sign_warning = '▲'
"let g:ale_sign_info = '○'    " untested
"let g:ale_sign_style_error = ''
"let g:ale_sign_style_warning = ''


"""""""""""""
" OmniSharp "
"""""""""""""

let g:OmniSharp_timeout = 5


""""""""""""""
" indentLine "
""""""""""""""

" Set indentation character (good options are '|', '¦', '┆', '┊')
let g:indentLine_char = '┆'

" Exclude some file types from showing indentations
let g:indentLine_fileTypeExclude = ['tex', 'markdown']


""""""""""""
" Startify "
""""""""""""

" Automatically save changes in sessions
let g:startify_session_persistence = 1

" Automatically load session file if it exists in a directory
let g:startify_session_autoload = 1

" Sort sessions alphabetically
let g:startify_session_sort = 0

" Configure startify layout
let g:startify_lists = [
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'files',     'header': ['   Recent files']            },
	\ { 'type': 'dir',       'header': ['   Files from last directory', '   -> ' . getcwd()] },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': 'commands',  'header': ['   Commands']       },
	\ ]
