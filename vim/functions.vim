" Open or close tagbar while keeping buffergator as the rightmost window
function! ToggleTagbar()
	:BuffergatorClose
	:TagbarToggle
	:BuffergatorOpen
	:wincmd p
endfunction

" Returns true if buffergator is currently open and false otherwise
function! BuffergatorIsOpen()
	return bufname("[[buffergator-buffers]]") == "[[buffergator-buffers]]"
endfunction

" Returns true if buffergator is currently the active buffer and false otherwise
function! BuffergatorIsActive()
	return bufname("%") == "[[buffergator-buffers]]"
endfunction

" Open TimeLapse in a new tab and avoid conflicts with buffergator while doing it
function! OpenTimeLapse()
	:BuffergatorClose
	:call TimeLapse()
	:tabprevious
	:BuffergatorOpen
	:wincmd p
	:tabnext
endfunction

" Open a terminal buffer in a split below the current window, execute a command and give control back to user
function! OpenSplitTerm(cmd)
	belowright split
	resize 15
	execute "terminal bash -c \"" . a:cmd . " ; bash\""
endfunction

" Insert a tab or start auto-completion depending on the preceding character
function! TabOrComplete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction

" Close buffer without conflicting with buffergator
function! CloseBuffer()
	:BuffergatorClose
	:bdelete
	:BuffergatorOpen
	:wincmd p
endfunction

" Close window if it it not the last window remaining, excluding buffergator
" Also sends 'q' as a keypress instead of a command (':q') if it is in a window where a 'q' key press quits all associated windows. (e.g. Mundo)
function! MagicWindowClose()
	if (winnr("$") == 1 || (winnr("$") == 2 && BuffergatorIsOpen()))
		echo "last window - not closing"
	else
		let currBufName = bufname("%")
		if (currBufName == "__Mundo__" || currBufName == "__Mundo_Preview__" || currBufName == "[[buffergator-buffers]]")
			normal q
		else
			quit
		endif
	endif
endfunction

" Like bufdo but restore the current buffer and alternate buffer
function! Bufdo(command)
  let currBuf = bufnr("%")
  let curaltBuf = bufnr('#')

  execute 'bufdo ' . a:command
  " restore previous/alt buffer
  execute 'buffer ' . curaltBuf
  " restore active buffer
  execute 'buffer ' . currBuf
endfunction

" Reload all buffers and reenable syntax highlighting
function! ReloadBuffers()
	call Bufdo("e")
	:syntax on
endfunction
