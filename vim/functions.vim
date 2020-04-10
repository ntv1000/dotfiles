" Open a terminal buffer in a split below the current window, execute a command and give control back to user
function! OpenSplitTerm(cmd)
	belowright split
	resize 15
	execute "terminal zsh -c \"" . a:cmd . " ; zsh\""
	execute "normal! G"
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
	let bufCount = len(getbufinfo({'buflisted':1}))
	if (bufCount == 1)
		echo "last buffer - not closing"
	else
		:bdelete
	endif
endfunction


" Close window if it it not the last window remaining
" Also sends 'q' as a keypress instead of a command (':q') if it is in a window where a 'q' key press quits all associated windows. (e.g. Mundo)
function! MagicWindowClose()
	if (winnr("$") == 1)
		echo "last window - not closing"
	else
		let currBufName = bufname("%")
		if (currBufName == "__Mundo__" || currBufName == "__Mundo_Preview__")
			normal q
		elseif (currBufName =~ "term://")
			:bwipeout!
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
	if (curaltBuf != -1)
		execute 'buffer ' . curaltBuf
	endif
	" restore active buffer
	execute 'buffer ' . currBuf
endfunction


" Reload all buffers and reenable syntax highlighting
function! ReloadBuffers()
	call Bufdo("e")
	:syntax on
endfunction


" Change the working directory to git root if available
function! GoToGitRoot() abort
	let l:git_dir = finddir(".git", ";")
	if l:git_dir != ''
		execute 'cd' fnameescape(l:git_dir)
		execute 'cd ../'

		let l:pwd = getcwd()
		echo 'Found git root: ' . l:pwd
	else
		echo 'Could not find git root.'
	endif
endfunction


" Toggle character at the end of line
function! ToggleEndChar(char) abort
	let l:old = getline('.')

	if l:old =~ a:char . '$'
		let l:new = substitute(l:old, '\v'.a:char.'$', '', '')
	else
		let l:new = l:old . a:char
	endif

	call setline('.', l:new)
endfunction


" Taken and simplified from https://github.com/thaerkh/vim-workspace/blob/faa835406990171bbbeff9254303dad49bad17cb/plugin/workspace.vim#L162
function! Autosave() abort
	if &readonly || mode() == 'c' || pumvisible()
		return
	endif

	silent! update  " only updates if there are changes to the file.
endfunction
