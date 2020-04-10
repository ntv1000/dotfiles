" Disable auto-comment-insertion (add "cr" to disable it completely)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro


" XML filetype for ROS launch files
autocmd BufNewFile,BufRead *.launch set syntax=xml


" Autosave when leaving insert mode
autocmd InsertLeave * call Autosave()
" Autosave when leaving buffer
autocmd BufLeave * call Autosave()
" Autosave when idling
autocmd CursorHold * call Autosave()
" Autosave when vim loses focus
autocmd FocusLost * call Autosave()
" Autosave when vim gains focus
autocmd FocusGained * call Autosave()
