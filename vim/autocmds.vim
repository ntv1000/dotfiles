" Disable auto-comment-insertion (add "cr" to disable it completely)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro


" XML filetype for ROS launch files
autocmd BufNewFile,BufRead *.launch set syntax=xml


" Autosave when leaving insert mode
autocmd InsertLeave * silent! write
" Autosave when leaving buffer
autocmd BufLeave * silent! write
" Autosave when idling
autocmd CursorHold * silent! write
" Autosave when vim loses focus
autocmd FocusLost * silent! write
" Autosave when vim gains focus
autocmd FocusGained * silent! write
