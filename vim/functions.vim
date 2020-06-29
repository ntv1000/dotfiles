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


" TODO Make a vim plugin out of this
" Alternatives:
" https://github.com/vim-scripts/vim-auto-save/
" Problems: screws up undo history, does not respect readonly files
" https://github.com/vim-scripts/vim-auto-save/
" Problems: Actually creates backups, autosaves periodically after a fixed time interval

let g:autosave_enabled = 0

" Taken and simplified from https://github.com/thaerkh/vim-workspace/blob/faa835406990171bbbeff9254303dad49bad17cb/plugin/workspace.vim#L162
function! Autosave() abort
	if g:autosave_enabled == 1
		if &readonly || mode() == 'c' || pumvisible()
			return
		endif

		silent! update " only updates if there are changes to the file.
	endif
endfunction

function! AutosaveToggle() abort
	if g:autosave_enabled == 1
		let g:autosave_enabled = 0
		echo "Autosave OFF"
	else
		let g:autosave_enabled = 1
		echo "Autosave ON"
	endif
endfunction


" Move the cursor in the denite buffer by `offset`. If the new cursor position
" would be above the first line the cursor will be placed on the last line and
" if the new cursor position would be below the last line it will be placed on
" the first line. `g:denite_win_id` needs to be set to the window id of the
" denite window for this function to work.
function! DeniteMoveCursor(offset) abort
	let l:bufnr = winbufnr(g:denite_win_id)

	python import vim
	let l:numlines = pyeval('len(vim.buffers['.(l:bufnr).'])')

	let l:pos = nvim_win_get_cursor(g:denite_win_id)
	let l:first_row = 1
	let l:last_row = l:numlines
	let l:new_row = l:pos[0] + a:offset

	if l:new_row < l:first_row
		let l:new_row = l:last_row
	endif

	if l:new_row > l:last_row
		let l:new_row = l:first_row
	endif

	call nvim_win_set_cursor(g:denite_win_id, [l:new_row, 0])
endfunction
