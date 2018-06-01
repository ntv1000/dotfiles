function! ToggleTagbar()
	:BuffergatorClose
	:TagbarToggle
	:BuffergatorOpen
	:wincmd p
endfunction

" buffergator configuration
function! BuffergatorIsOpen()
	return bufname("[[buffergator-buffers]]") == "[[buffergator-buffers]]"
endfunction

function! BuffergatorIsActive()
	return bufname("%") == "[[buffergator-buffers]]"
endfunction

function! OpenTimeLapse()
	:BuffergatorClose
	:call TimeLapse()
	:tabprevious
	:BuffergatorOpen
	:wincmd p
	:tabnext
endfunction

function! OpenSplitTerm(cmd)
	belowright split
	resize 15
	execute "terminal bash -c \"" . a:cmd . " ; bash\""
endfunction
" auto-complete with tab
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction

function! CloseBuffer()
	:BuffergatorClose
	:bdelete
	:BuffergatorOpen
	:wincmd p
endfunction
" easiert window switchting
function! CloseIfNotLastWindow()
	if (winnr("$") == 1 || (winnr("$") == 2 && BuffergatorIsOpen()))
		echo "last window - not closing"
	else
		quit
	endif
endfunction
" shortcut to reload all buffers
function! ReloadBuffers()
	:bufdo e
	:syntax on
endfunction
